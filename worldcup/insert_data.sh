#! /bin/bash


if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear tables to start fresh
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    # --- 1. HANDLE WINNER TEAM ---
    # Check if winner exists
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    
    # If not found, insert it
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      # Get the new ID
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # --- 2. HANDLE OPPONENT TEAM ---
    # Check if opponent exists
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    
    # If not found, insert it
    if [[ -z $OPPONENT_ID ]]
    then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      # Get the new ID
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # --- 3. INSERT GAME ROW ---
    # Now WINNER_ID and OPPONENT_ID are guaranteed to have values!
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted game: $YEAR $ROUND - $WINNER vs $OPPONENT"
    fi
  fi
done