#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
RUN="$($PSQL "TRUNCATE TABLE games, teams")"

#Open games.csv
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPO WINGOALS OPPOGOALS
do
  if [[ $YEAR != 'year' ]]
  then
    #Add each unique team to the "teams" table
    WIN_NAME="$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")"
    OPP_NAME="$($PSQL "SELECT name FROM teams WHERE name = '$OPPO'")"

    if [[ $WIN_NAME != $WINNER ]]
    then
      RUN="$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")"
    fi
    if [[ $OPP_NAME != $OPPO ]]
    then
      RUN="$($PSQL "INSERT INTO teams (name) VALUES ('$OPPO')")"
    fi

    #Each row should be mapped and added to the games table
    WIN_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
    OPP_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPO'")"
    echo "$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals)
      VALUES ($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINGOALS, $OPPOGOALS)")"
  fi
done