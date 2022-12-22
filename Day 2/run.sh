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
    shapepoints "${line[1]}"
    PlayTheGame "${line[0]}" "${line[1]}"
    PointsForGame $GameResults
    let totalscore+="$(($Spoints+$Gpoints))"
  done < $inputfile

echo $totalscore

