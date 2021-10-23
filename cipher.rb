# Check if the given character is a unicode letter (alphabet symbol)
# @param [String] char a string with a single character
# @return [Boolean] true if the character is a letter, false otherwise
def letter?(char)
  # solution from https://stackoverflow.com/a/14551970
  char.match?(/[[:alpha:]]/)
end

# Check if the given string is entirely in uppercase
# @param [String] string to be checked
# @return [Boolean] true if the string is uppercase, false otherwise
def is_upper?(string)
  string == string.upcase
end

# Shift a letter in the ASCII alphabet by key places, wrapping around to the
# start of the alphabet if necessary. Preserves case.
# @param [String] letter an ASCII letter character
# @param [Integer] key shift letter by key positions
# @return [String] letter shifted by key positions in alphabet
def shift(letter, key)
  alphabet_end_code = is_upper?(letter) ? "Z".ord : "z".ord
  letter_code = letter.ord
  ciphered_code = letter_code + key

  if ciphered_code > alphabet_end_code
    # loop back around to start of alphabet
    ciphered_code -= 26
  end

  ciphered_code.chr
end

# Cipher a string using the caesar cipher to shift all letters in the string
# by a given key.
# @param [String] text_to_cipher The input text to be ciphered
# @param [Integer] key by how many positions to shift each letter in the text
# @return [String] the ciphered text
def caesar_cipher(text_to_cipher, key)
  # ensure key is a value between 0 and 25
  key = key % 26

  text_to_cipher.split("").map do |character|
    if letter?(character)
      shift(character, key)
    else
      character
    end
  end.join("")

end

puts caesar_cipher(ARGV[0], ARGV[1].to_i)
