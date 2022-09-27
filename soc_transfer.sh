#!/bin/bash

1> out.txt
echo 2 | sbt run
mv myCPU.v ysyx_041812.v
sed -i "s/_myCPU//g" ysyx_041812.v
cp ./ysyx_041812.v ../ysyxSoC/ysyx/soc
#pushd ./
#cd ../socTest
#make run
#./obj_dir/VysyxSoCFull
#pushd +1
