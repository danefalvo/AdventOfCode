#!/bin/bash
inputfile='./input'
BagIterator=1
TotalPriority=0



function translateToPriority {
  CaptureVar=$1
  echo $CaptureVar
case $1 in

  a)
   addvalue=1
    ;;

  b)
   addvalue=2
    ;;

  c)
   addvalue=3
    ;;

  d)
   addvalue=4
    ;;

  e)
   addvalue=5
    ;;

  f)
   addvalue=6
    ;;

  g)
   addvalue=7
    ;;

  h)
   addvalue=8
    ;;

  i)
   addvalue=9
    ;;

  j)
   addvalue=10
    ;;

  k)
   addvalue=11
    ;;

  l)
   addvalue=12
    ;;

  m)
   addvalue=13
    ;;

  n)
   addvalue=14
    ;;

  o)
   addvalue=15
    ;;

  p)
   addvalue=16
    ;;

  q)
   addvalue=17
    ;;

  r)
   addvalue=18
    ;;

  s)
   addvalue=19
    ;;

  t)
   addvalue=20
    ;;

  u)
   addvalue=21
    ;;

  v)
   addvalue=22
    ;;

  w)
   addvalue=23
    ;;

  x)
   addvalue=24
    ;;

  y)
   addvalue=25
    ;;

  z)
   addvalue=26
    ;;

  A)
   addvalue=27
    ;;

  B)
   addvalue=28
    ;;

  C)
   addvalue=29
    ;;

  D)
   addvalue=30
    ;;

  E)
   addvalue=31
    ;;

  F)
   addvalue=32
    ;;

  G)
   addvalue=33
    ;;

  H)
   addvalue=34
    ;;

  I)
   addvalue=35
    ;;

  J)
   addvalue=36
    ;;

  K)
   addvalue=37
    ;;

  L)
   addvalue=38
    ;;

  M)
   addvalue=39
    ;;

  N)
   addvalue=40
    ;;

  O)
   addvalue=41
    ;;

  P)
   addvalue=42
    ;;

  Q)
   addvalue=43
    ;;

  R)
   addvalue=44
    ;;

  S)
   addvalue=45
    ;;

  T)
   addvalue=46
    ;;

  U)
   addvalue=47
    ;;

  V)
   addvalue=48
    ;;

  W)
   addvalue=49
    ;;

  X)
   addvalue=50
    ;;

  Y)
   addvalue=51
    ;;

  Z)
   addvalue=52
    ;;

esac

  #sed "s/a/ 1 /g;s/b/ 2 /g;s/c/ 3 /g;s/d/ 4 /g;s/e/ 5 /g;s/f/ 6 /g;s/g/ 7 /g;s/h/ 8 /g;s/i/ 9 /g;s/j/ 10 /g;s/k/ 11 /g;s/l/ 12 /g;s/m/ 13 /g;s/n/ 14 /g;s/o/ 15 /g;s/p/ 16 /g;s/q/ 17 /g;s/r/ 18 /g;s/s/ 19 /g;s/t/ 20 /g;s/u/ 21 /g;s/v/ 22 /g;s/w/ 23 /g;s/x/ 24 /g;s/y/ 25 /g;s/z/ 26 /g;s/A/ 27 /g;s/B/ 28 /g;s/C/ 29 /g;s/D/ 30 /g;s/E/ 31 /g;s/F/ 32 /g;s/G/ 33 /g;s/H/ 34 /g;s/I/ 35 /g;s/J/ 36 /g;s/K/ 37 /g;s/L/ 38 /g;s/M/ 39 /g;s/N/ 40 /g;s/O/ 41 /g;s/P/ 42 /g;s/Q/ 43 /g;s/R/ 44 /g;s/S/ 45 /g;s/T/ 46 /g;s/U/ 47 /g;s/V/ 48 /g;s/W/ 49 /g;s/X/ 50 /g;s/Y/ 51 /g;s/Z/ 52 /g" '$($CaptureVar)'
}

function BagBreakdown {
# Loop through each line of the input
while read line || [ -n "$line" ] ; do
  echo ""
  ItemList=$line
  CountofItems=${#line}
  CompartmentAContents=${ItemList:0:$(($CountofItems/2))}
  CompartmentBContents=${ItemList:$(($CountofItems/2)):$CountofItems}
  echo "Items in Bag $BagIterator: $CountofItems"
  echo "Compartment A: $CompartmentAContents"
  echo "Compartment B: $CompartmentBContents"
  CompareContents "$CompartmentAContents" "$CompartmentBContents"
  BagIterator="$(($BagIterator+1))"
  done < $inputfile
}

function CompareContents {
  contentsA=$1
  contentsB=$2
for (( i=0; i<${#contentsA}; i++ )); do
#  echo "${contentsA:$i:1}"
  if [[ "$contentsB" == *"${contentsA:$i:1}"* ]]; then
    translateToPriority "${contentsA:$i:1}" #Single matching character
    echo "Priority of matching item ${contentsA:$i:1} is $addvalue"
    TotalPriority=$(($TotalPriority+$addvalue))
    echo "Total Priority is now $TotalPriority"
#    echo $addvalue
    break
fi
done


}

  BagBreakdown
echo $TotalPriority


