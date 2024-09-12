#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | tail -n +2 | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  INSERT_WINNER_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER') ON CONFLICT (name) DO NOTHING;")
  if [[ $INSERT_WINNER_TEAM_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into teams: $WINNER
  fi

  INSERT_OPPONENT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT') ON CONFLICT (name) DO NOTHING;")
  if [[ $INSERT_OPPONENT_TEAM_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into teams: $OPPONENT
  fi

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

  INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
    echo Inserted into games: $YEAR, $ROUND, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS
  fi
done
