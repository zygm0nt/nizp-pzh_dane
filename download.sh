#!/bin/bash

function data_link() {
    YEAR=$1
    MONTH=$2
    TERM=$3

    echo "http://wwwold.pzh.gov.pl/oldpage/epimeld/grypa/20${YEAR}/G_${YEAR}_`printf %02d ${MONTH}`${TERM}.pdf"
}

function data_link_old() {
    YEAR=$1
    MONTH=$2

    echo "http://wwwold.pzh.gov.pl/oldpage/epimeld/grypa/20${YEAR}/G_${YEAR}_`printf %02d ${MONTH}`.pdf"
}


for year in 00 01 02 03 04 05 06
do
  for month in {1..38}
  do
     wget -c `data_link_old $year $month`
  done
done

for year in 07 08 09 10 11 12 13 14 15 16 17 18 19
do
  for month in {1..12}
  do
      for term in A B C D
      do
         wget -c `data_link $year $month $term` 
      done
  done
done
