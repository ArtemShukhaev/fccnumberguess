#!/bin/bash

NUMBER=$(( 1 +$RANDOM%1000 ))

PSQL="psql -X -U freecodecamp -d number_guess --tuples-only -c"

echo "Enter your username:"
read NAME

SEARCH=$($PSQL "select * from users where name = '$NAME'")

if [[ -z $SEARCH ]]
then
  echo "Welcome, $NAME! It looks like this is your first time here."
  ADDUSER=$($PSQL "insert into users(name) values('$NAME')")
else
  COUNT=$($PSQL "select count(*) from games left join users using(user_id) where users.name = '$NAME'")
  BEST=$($PSQL "select min(games.guesses) from games left join users using(user_id) where users.name = '$NAME'")
  echo "Welcome back, $NAME! You have played $COUNT games, and your best game took $BEST guesses."
fi
ID=$($PSQL "select user_id from users where name = '$NAME'")
GUESS=0
TRIES=0
echo "Guess the secret number between 1 and 1000:"
while [[ $GUESS != $NUMBER ]]
do
  read GUESS
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    if [[ $GUESS > $NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    fi
    if [[ $GUESS < $NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
  TRIES=$((TRIES + 1))
done

echo "You guessed it in $TRIES tries. The secret number was $NUMBER. Nice job!"
GAME=$($PSQL "insert into games(user_id, guesses) values($ID, $TRIES)")
