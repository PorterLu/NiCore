#!/bin/bash
echo 2 | sbt run
mv myCPU.v nicore.v
cp ./nicore.v ../ysyx-workbench/myCPU/vsrc
