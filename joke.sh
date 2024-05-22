#!/bin/bash

# Function to fetch jokes
fetch_jokes() {
  search_term=$1
  num_jokes=$2
  interval=$3
  total_duration=$4

  # Calculate the total number of requests based on duration and interval
  total_requests=$((total_duration / interval))

  for ((i=0; i<total_requests; i++))
  do
    clear  # Clear the terminal before showing new set of jokes
    echo "Fetching joke set $((i+1)) of $total_requests"
    clear  # Clear the terminal before showing new set of jokes
    for ((j=0; j<num_jokes; j++))
    do
      joke=$(curl -s "https://icanhazdadjoke.com/search?term=${search_term}" -H "Accept: application/json" | jq -r ".results[$j].joke")
      echo "Joke $((j+1)): $joke"
    done
    sleep $interval
  done
}

# User input
echo "Enter search term:"
read search_term
echo "Enter number of jokes per set:"
read num_jokes

# Call the function with search term, number of jokes, interval, and duration
fetch_jokes $search_term $num_jokes 15 60
