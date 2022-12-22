#!/bin/bash
echo "Advent of Code - Day 2"
elf=1
totalCal=0
highesttotalcal=0
elfwiththemost=0
inputfile='./input'
calorieCount=()
SumOfxElves=3
SumOfCalories=0

# Loop through each line of the input
while read line; do
if [ -z "$line" ]; # True if line is blank (So "ON NEXT ELF")
then
    calorieCount+=("$totalCal")  # write the total count of Calories into the array
    totalCal=0  # Reset the total calorie count
    elf="$(($elf+1))" # Iterate through Elves
else
    totalCal="$(($totalCal+$line))" # Add the next line of calories
fi
done < $inputfile

readarray -td '' b < <(printf '%s\0' "${calorieCount[@]}" | sort -z)
numberofelves="${#b[@]}" #Number of Elves
echo "${b[@]}" #Calories per Elf
echo "$numberofelves"

echo "${b[($numberofelves-1)]}" # Most Cals
echo "${b[($numberofelves-2)]}" # Next Least
echo "${b[($numberofelves-3)]}" # 3rd highest
for ((i=$numberofelves-$SumOfxElves; i<$numberofelves; i++)); do
  let SumOfCalories+="${b[$i]}" # 3 highest calorie counts
done
echo "Total Sum of Calories $SumOfCalories"

