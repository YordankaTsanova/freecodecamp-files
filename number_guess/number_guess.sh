#!/bin/bash

# Database connection variable (Silent mode)
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Generate secret number
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read USERNAME

# Get user data
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME'")

# If user not found
if [[ -z $USER_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # Insert user and hide the "INSERT 0 1" message
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  # Use IFS to split the data into variables
  echo "$USER_DATA" | while IFS="|" read GAMES_PLAYED BEST_GAME
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

echo "Guess the secret number between 1 and 1000:"
GUESS_COUNT=0

while true
do
  read GUESS
  ((GUESS_COUNT++))

  # If not an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    # Reset count or adjust based on how you want to handle non-integers (usually FCC doesn't count these as tries)
    ((GUESS_COUNT--))
  elif [[ $GUESS -eq $SECRET_NUMBER ]]
  then
    # Win condition
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi
done

# --- UPDATE DATABASE AT THE END ---

# Get current user ID and stats again for accuracy
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID")
BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID")

# Increment games played
((GAMES_PLAYED++))
UPDATE_GAMES=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE user_id=$USER_ID")

# Update best game if it's the first win or fewer guesses than before
if [[ -z $BEST_GAME || $GUESS_COUNT -lt $BEST_GAME ]]
then
  UPDATE_BEST=$($PSQL "UPDATE users SET best_game = $GUESS_COUNT WHERE user_id=$USER_ID")
fi