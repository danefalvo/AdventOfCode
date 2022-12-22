#!/bin/bash
echo "Advent of Code - Day 1"
elf=1
totalcal=0
highesttotalcal=0
elfwiththemost=0
inputfile='./input'


while read line; do
if [ -z "$line" ]; #True if line is blank
then
    echo "Elf $(($elf)):$totalcal"
    if [ "$totalcal" -gt "$highesttotalcal" ]
    then
        elfwiththemost="$(($elf))"
        highesttotalcal="$(($totalcal))"
    fi
    totalcal=0
    elf="$(($elf+1))"
    
else
    totalcal="$(($totalcal+$line))"
fi
done < $inputfile

echo "Who's carrying the most?"
echo "Elf number $elfwiththemost carrying $highesttotalcal calories"