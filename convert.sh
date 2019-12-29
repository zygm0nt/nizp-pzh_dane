#!/bin/bash


mkdir pngs
rm pngs/*

set -x 
for file in data/*
do
    out_file="pngs/`basename ${file}`.png"
    pdftoppm -l 1 -png -r 900 -x 1578 -y 2850 -W 486 -H 160 ${file} > $out_file
    value=`gocr pngs/`basename ${file}`.png`
    echo "`basename ${file}`,$value" >> report.csv
done
