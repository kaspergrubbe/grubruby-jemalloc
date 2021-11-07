#!/bin/bash
# for ((i=1;i<=100;i++));
for ((i=1;i<=10;i++));
do
  /app/optcarrot/bin/optcarrot --headless --print-fps --frames 180 /app/optcarrot/examples/Lan_Master.nes
done
