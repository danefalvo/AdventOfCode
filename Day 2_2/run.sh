#!/bin/bash
  #A/X=ROCK=1
  #B/Y=PAPER=2
  #C/Z=SCISSORS=3

inputfile='./input'
totalscore=0

function shapepoints {
    if [ "$1" = 'X' ] 
    then 
      Spoints=1
    fi
    if [ "$1" = 'Y' ] 
    then 
      Spoints=2
    fi
    if [ "$1" = 'Z' ] 
    then 
      Spoints=3
    fi
    return $Spoints
}

function resultRequired {
  if [ "$1" = 'X' ] 
    then 
#      echo "Goal: L"
      if [ "$2" = 'A' ] #Rock
      then
        playSymbol=Z #Scissors
      fi
      if [ "$2" = 'B' ] #Paper
      then
        playSymbol=X #Rock
      fi
      if [ "$2" = 'C' ] #Scissors
      then
        playSymbol=Y #Paper
      fi
  fi
  if [ "$1" = 'Y' ] 
    then 
#      echo "Goal: D"
      if [ "$2" = 'A' ] #Rock
      then
        playSymbol=X #Rock
      fi
      if [ "$2" = 'B' ] #Paper
      then
        playSymbol=Y #Paper
      fi
      if [ "$2" = 'C' ] #Scissors
      then
        playSymbol=Z #Scissors
      fi
  fi
  if [ "$1" = 'Z' ] 
    then 
#      echo "Goal: W" 
      if [ "$2" = 'A' ] #Rock
      then
        playSymbol=Y #Paper
      fi
      if [ "$2" = 'B' ] #Paper
      then
        playSymbol=Z #Scissors
      fi
      if [ "$2" = 'C' ] #Scissors
      then
        playSymbol=X #Rock
      fi
  fi
}

function PlayTheGame {


  if [ "$1" = 'A' ] 
  then 
    if [ "$2" = 'X' ] 
    then 
      GameResults=D #RvR
    fi
    if [ "$2" = 'Y' ] 
    then 
      GameResults=W #RvP
    fi
    if [ "$2" = 'Z' ] 
    then 
      GameResults=L #RvS
    fi
  fi
  if [ "$1" = 'B' ] 
  then 
    if [ "$2" = 'X' ] 
    then 
      GameResults=L #PvR 
    fi
    if [ "$2" = 'Y' ] 
    then 
      GameResults=D #PvP
    fi
    if [ "$2" = 'Z' ] 
    then 
      GameResults=W #PvS
    fi
  fi
  if [ "$1" = 'C' ] 
  then 
    if [ "$2" = 'X' ] 
    then 
      GameResults=W #SvR
    fi
    if [ "$2" = 'Y' ] 
    then 
      GameResults=L #SvP
    fi
    if [ "$2" = 'Z' ] 
    then 
      GameResults=D #SvS
    fi
  fi
}

function PointsForGame {
case "$1" in
    W)
        Gpoints=6
        ;;
    L)
        Gpoints=0
        ;;
    D)
        Gpoints=3
        ;;
    *)
        Gpoints=0
esac
return $Gpoints
}

#  echo "READING LINE $line"
  #IFS=' '     # space is set as delimiter
  while IFS=' ' read -ra line || [ -n "$line" ] ; do
    resultRequired "${line[1]}" "${line[0]}"
    PlayTheGame "${line[0]}" "$playSymbol"
    shapepoints "$playSymbol"
    PointsForGame "$GameResults"
    let totalscore+="$(($Spoints+$Gpoints))"
  done < $inputfile

echo $totalscore

