/*
 * C runtime of riscv-hyp-tests on NiCore: the console on the 16550 UART,
 * the power-off register and the few libc functions the tests call. The
 * toolchain's own libc is built with compressed instructions, which NiCore
 * does not have.
 */
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>

#define UART_BASE   0x10000000UL
#define FINISH_BASE 0x00100000UL	/* SiFive test device */

static void put(char c)
{
	volatile uint8_t *uart = (volatile uint8_t *)UART_BASE;

	while (!(uart[5] & 0x20))	/* LSR: transmitter holding register empty */
		;
	uart[0] = c;
}

int putchar(int c)
{
	if (c == '\n')
		put('\r');
	put(c);
	return c;
}

int puts(const char *s)
{
	while (*s)
		putchar(*s++);
	putchar('\n');
	return 0;
}

size_t strlen(const char *s)
{
	size_t n = 0;

	while (s[n])
		n++;
	return n;
}

void *memset(void *dest, int byte, size_t n)
{
	unsigned char *d = dest;

	while (n--)
		*d++ = byte;
	return dest;
}

void *memcpy(void *dest, const void *src, size_t n)
{
	unsigned char *d = dest;
	const unsigned char *s = src;

	while (n--)
		*d++ = *s++;
	return dest;
}

/* Print `text` (n characters) in a field of `width`, padded with `fill`. */
static void field(const char *text, int n, int width, int left, char fill)
{
	if (!left)
		for (int i = n; i < width; i++)
			putchar(fill);
	for (int i = 0; i < n; i++)
		putchar(text[i]);
	if (left)
		for (int i = n; i < width; i++)
			putchar(' ');
}

/* The conversions the tests use: flags - and 0, a width and a precision
 * (numbers or *), the lengths l, ll and z, and d i u x X p s c %. */
int printf(const char *format, ...)
{
	va_list args;

	va_start(args, format);
	for (; *format; format++) {
		if (*format != '%') {
			putchar(*format);
			continue;
		}

		int left = 0, width = 0, precision = -1, is_long = 0;
		char fill = ' ';

		for (format++; *format == '-' || *format == '0'; format++) {
			if (*format == '-')
				left = 1;
			else
				fill = '0';
		}
		if (*format == '*') {
			width = va_arg(args, int);
			format++;
		}
		while (*format >= '0' && *format <= '9')
			width = width * 10 + *format++ - '0';
		if (*format == '.') {
			precision = 0;
			format++;
			if (*format == '*') {
				precision = va_arg(args, int);
				format++;
			}
			while (*format >= '0' && *format <= '9')
				precision = precision * 10 + *format++ - '0';
		}
		while (*format == 'l' || *format == 'z') {
			is_long = 1;
			format++;
		}

		char digits[24];
		int n = 0;

		switch (*format) {
		case 's': {
			const char *s = va_arg(args, const char *);
			int length = 0;

			while (s[length] && (precision < 0 || length < precision))
				length++;
			field(s, length, width, left, ' ');
			break;
		}
		case 'c':
			digits[0] = va_arg(args, int);
			field(digits, 1, width, left, ' ');
			break;
		case 'd': case 'i': case 'u': case 'x': case 'X': case 'p': {
			const int base = (*format == 'd' || *format == 'i' || *format == 'u') ? 10 : 16;
			const int is_signed = *format == 'd' || *format == 'i';
			uint64_t value;
			int negative = 0;

			if (is_long || *format == 'p')
				value = va_arg(args, uint64_t);
			else if (is_signed)
				value = (uint64_t)(int64_t)va_arg(args, int);
			else
				value = va_arg(args, unsigned int);
			if (is_signed && (int64_t)value < 0) {
				negative = 1;
				value = -value;
			}
			do {
				digits[sizeof(digits) - ++n] = "0123456789abcdef"[value % base];
				value /= base;
			} while (value);
			if (negative)
				digits[sizeof(digits) - ++n] = '-';
			field(digits + sizeof(digits) - n, n, width, left, fill);
			break;
		}
		case '%':
			putchar('%');
			break;
		case '\0':
			format--;
			break;
		}
	}
	va_end(args);
	return 0;
}

void _init(void)
{
}

void exit(int code)
{
	*(volatile uint32_t *)FINISH_BASE = code ? ((uint32_t)code << 16) | 0x3333 : 0x5555;
	for (;;)
		;
}
