# Program to solve the FizzBuzz problem BETTER
# Written by Chad Sebesta

# For every number in range 1-100
for n in {1..100}; do

	# Create empty result variable
	result=""

	# If n is divisible by 3
	if (( $n % 3 == 0 )); then
		result="Fizz"
	fi

	# If n is divisible by 5
	if (( $n % 5 == 0 )); then
		result="${result}Buzz"
	fi

	# If n is divisible by neither 3 nor 5
	if [[ $result == "" ]]; then
		echo "$n"
	else
		echo $result
	fi

done
