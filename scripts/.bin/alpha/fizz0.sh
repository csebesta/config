# Script that plays the classic children's game FizzBuzz
# Written by Chad Sebesta

# For the numbers 1-100...
for n in {1..100}; do

	# If number is divisible by 3
	if (( $n % 3 == 0 )); then
		printf "Fizz"

		# If number is also divisible by 5
		if (( $n % 5 == 0 )); then
			printf "Buzz"
		fi

	# If number is divisible by 5
	elif (( $n % 5 == 0 )); then
		printf "Buzz"

	# If number is not divisble by 3 or 5
	else
		printf "$n"
	fi

	# Print newline
	printf "\n"

done
