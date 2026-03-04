#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # 1. Display available services
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # 2. Get user input
  read SERVICE_ID_SELECTED

  # 3. Check if input is a valid service_id
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # 4. If not found, send back to main menu
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    # 3. GET CUSTOMER PHONE
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # 4. IF NEW CUSTOMER, GET NAME
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      
      # Insert new customer
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
    fi

    # 5. GET APPOINTMENT TIME
    # Note: Using sed to trim the space from the database output for $SERVICE_NAME
    CLEAN_SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/ //g')
    CLEAN_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ //g')

    echo -e "\nWhat time would you like your $CLEAN_SERVICE_NAME, $CLEAN_CUSTOMER_NAME?"
    read SERVICE_TIME

    # 6. THE FINAL PIECE: CREATE APPOINTMENT
    # Get customer_id (essential for the foreign key)
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # 7. FINAL MESSAGE
    echo -e "\nI have put you down for a $CLEAN_SERVICE_NAME at $SERVICE_TIME, $CLEAN_CUSTOMER_NAME."
  fi
}

MAIN_MENU