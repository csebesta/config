# Program to solve the FizzBuzz problem BETTER
# Written by Chad Sebesta

# For every number in 1-100
for n in {1..100}; do

	# If n is divisible by 3
	if (( $n % 3 == 0 )); then
		echo -n "Fizz"
	fi

	# If n is divisible by 5
	if (( $n % 5 == 0 )); then
		echo -n "Buzz"
	fi

	# If n is divisible by neither 3 nor 5
	if (( $n % 3 != 0 )) && (( $n % 5 != 0 )); then
		echo -n "$n"
	fi

	# Print newline
	printf "\n"

done
