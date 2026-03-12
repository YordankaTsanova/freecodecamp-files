#!/bin/bash

# Database connection string
PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument is provided
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Determine if the input is a number or a string
if [[ $1 =~ ^[0-9]+$ ]]; then
  # Search by atomic number
  CONDITION="e.atomic_number = $1"
else
  # Search by symbol or name
  CONDITION="e.symbol = '$1' OR e.name = '$1'"
fi

# Execute the query
# We join elements, properties, and types to get all the data
ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius 
                      FROM elements e
                      INNER JOIN properties p ON e.atomic_number = p.atomic_number
                      INNER JOIN types t ON p.type_id = t.type_id
                      WHERE $CONDITION")

# Check if result is empty
if [[ -z $ELEMENT_INFO ]]; then
  echo "I could not find that element in the database."
else
  # Format the output using IFS (Internal Field Separator)
  echo "$ELEMENT_INFO" | while IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
fi