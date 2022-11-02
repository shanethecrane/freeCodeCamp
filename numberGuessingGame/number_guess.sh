#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
NUM=$((1+$RANDOM%1000))
#echo $NUM
echo "Enter your username:"
read USERNAME
# check if the username is already in the database
USERQ="$($PSQL "SELECT * FROM number_guess WHERE username = '$USERNAME'")"
# if not, welcome them for the first time
if [[ -z $USERQ ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
# if yes, welcome them back
else
  echo "$USERQ" | while read USER BAR GAMESPL BAR BESTROUND
  do
    echo "Welcome back, $USER! You have played $GAMESPL games, and your best game took $BESTROUND guesses."
  done
fi
# Begin the guessing
WIN=FALSE
ROUND=0
echo "Guess the secret number between 1 and 1000:"
while [ "$WIN" != "TRUE" ]
do
  read GUESS
  # Check if the input is an integer
  if [[ $GUESS =~ ^-?[0-9]+$ ]]
  then
    # if so, check for success
    if (( GUESS==NUM ))
    then
      WIN=TRUE
    else
      # they didn't win, so tell them if it's higher or lower
      if (( GUESS > NUM ))
      then
        echo "It's lower than that, guess again:"
      else
        echo "It's higher than that, guess again:"
      fi
    fi
  # If the input isn't an integer, lambast them for it
  else
    echo "That is not an integer, guess again:"
  fi
  ((++ROUND))
done
# They did, congratulate them and then add a record to the DB
echo "You guessed it in $ROUND tries. The secret number was $NUM. Nice job!"
# If they haven't played before, enter their initial record
if [[ -z $USERQ ]]
then
  INSERT="$($PSQL "INSERT INTO number_guess VALUES ('$USERNAME', 1, $ROUND);")"
# If they have previously played, update their records
else
  echo "$USERQ" | while read USER BAR GAMESPL BAR BESTROUND
  do
    (( GAMESPL++ ))
    if (( ROUND < BESTROUND ))
    then
      UPDATE="$($PSQL "UPDATE number_guess SET round_count = $ROUND, games_played = $GAMESPL WHERE username = '$USERNAME'")"
    # If it wasn't better, only update games played
    else
      UPDATE="$($PSQL "UPDATE number_guess SET games_played = $GAMESPL WHERE username = '$USERNAME'")"
    fi
  done
fi