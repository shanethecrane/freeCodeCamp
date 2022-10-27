#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# The intent of this function is to gather and output all of the data associated with the element queried
# $1=atomic number
# $2=symbol
# $3=name
GATHER_INFO() {
  PROPSQ="$($PSQL "SELECT * FROM properties WHERE atomic_number = $1")"
  echo "$PROPSQ" | while read ATOMIC BAR MASS BAR MELT BAR BOIL BAR TYPE_ID
  do
    TYPEQ="$($PSQL "SELECT * FROM types WHERE type_id = $TYPE_ID")"
    echo "$TYPEQ" | while read TYPE_ID BAR TYPE
    do
      echo "The element with atomic number $1 is $3 ($2). It's a $TYPE, with a mass of $MASS amu. $3 has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
    done
  done
}

# If no variable is passed in, provide angst
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # Otherwise, check the name query first
  NAMEQ="$($PSQL "SELECT * FROM elements WHERE name = '$1'")"
  if [[ -z $NAMEQ ]]
  then
    # If that fails, check based on symbol next
    SYMBOLQ="$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")"
    if [[ -z $SYMBOLQ ]]
    then
      # Last, check based on atomic number
      ATOMICQ="$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")"
      if [[ -z $ATOMICQ ]]
      then
        echo "I could not find that element in the database."
      else
        echo "$ATOMICQ" | while read ATOMIC BAR SYMBOL BAR NAME
      do
        GATHER_INFO $ATOMIC $SYMBOL $NAME
      done
      fi
    else
      echo "$SYMBOLQ" | while read ATOMIC BAR SYMBOL BAR NAME
      do
        GATHER_INFO $ATOMIC $SYMBOL $NAME
      done
    fi
  else 
    echo "$NAMEQ" | while read ATOMIC BAR SYMBOL BAR NAME
    do
      GATHER_INFO $ATOMIC $SYMBOL $NAME
    done
  fi
fi