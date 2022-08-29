#!/bin/bash

echo 2 | sbt run
mv myCPU.v ysyx_22041812.v
cp ./ysyx_22041812.v ../ysyx-workbench/myCPU/vsrc
