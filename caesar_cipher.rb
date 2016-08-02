puts "Welcome to the Cipher"
correct = "n"

#Gets user input
while correct != "y"
	puts "What is your message to be encoded?"
	caesar_s = gets.strip
	puts "What level encoding would you like to use? (#, non-zero)"
	encoding = gets.strip.to_i
	while encoding == 0
		puts "Please enter a numerical value other than 0"
		puts "What level encoding would you like to use? (#, non-zero)"
		encoding = gets.strip.to_i
	end

	puts "You are encoding #{caesar_s} with #{encoding} level(s) of encoding. Is this correct? (y/n)"
	correct = gets.strip
	if correct != "y"
		puts "Alright, resetting the cipher"
	end
end


#defines caesar_cipher method. this method converts strings to ASCII codes (string#ord), adds the cipher value, and then converts back to string (ASCII#chr)
def caesar_cipher(string, encode)
	n = 0
	new_ords = []
	split_s = string.split("")
	#converting to ASCII Codes
	while n < split_s.length
		letter = split_s[n]
		if letter.ord >= 65 && letter.ord<=90 # uppercase
			new_ord = letter.ord + encode
			if new_ord > 90 #wraparound the alphabet
				new_ord = new_ord - 90 + 64
			end
		
		elsif letter.ord >=97 && letter.ord<=122 # lowercase
			new_ord = letter.ord + encode
			if new_ord > 122 #wraparound the alphabet
				new_ord = new_ord - 122 + 96
			end
		elsif letter.ord >= 48 && letter.ord <= 57 #numbers
			new_ord = letter.ord + encode
			if new_ord > 57 #wraparound the numbers
				new_ord = new_ord - 57 + 48
			end
		else # symbols and punctuation
			new_ord = letter
		end
		new_ords[n] = new_ord
		n += 1
	end
	n = 0
	new_words = []
	#converting back to characters
	while n < new_ords.length
		new_words[n] = new_ords[n].chr
		n += 1
	end
	encrypted_phrase = new_words.join
	puts "Encoding complete: #{encrypted_phrase}"
end

caesar_cipher(caesar_s, encoding)