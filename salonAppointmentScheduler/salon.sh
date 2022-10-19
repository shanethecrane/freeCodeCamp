#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\n\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  BOOKING_MENU
}

BOOKING_MENU() {
  #display list of services
  #formatted like <service_id>) <service_name>
  SERVICES="$($PSQL "SELECT * FROM services")"
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  #prompt user to enter service_id
  #read into SERVICE_ID_SELECTED
  read SERVICE_ID_SELECTED
  #if service_id doesn't exist, loop
  SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")"
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    #prompt user to enter phone_number
    echo -e "\nWhat's your phone number?"
    #read into CUSTOMER_PHONE
    read CUSTOMER_PHONE

    #prompt user to enter name (if phone number is not in table)
    CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")"
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      #read into CUSTOMER_NAME
      read CUSTOMER_NAME
      #Add customer to the customers table
      $RESULT="$($PSQL "INSERT INTO customers
        (phone, name)
        VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")"
    fi

    CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ |/"/')
    SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/ |/"/')
    #prompt user to enter time
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    #read into SERVICE_TIME
    read SERVICE_TIME

    CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")"

    #insert into appointments table
    $RESULT="$($PSQL "INSERT INTO appointments
      (customer_id, service_id, time)
      VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")"

    #output "I have put you down for a <service> at <time>, <name>."
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

BOOKING_MENU