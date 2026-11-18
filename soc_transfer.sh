#!/bin/bash
echo 2 | sbt run
mv myCPU.v nicore.v
sed -i "s/_myCPU//g" nicore.v
cp ./nicore.v ../socTest/vsrc/
