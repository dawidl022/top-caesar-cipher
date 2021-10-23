def letter?(char)
  # solution from https://stackoverflow.com/a/14551970
  char.match?(/[[:alpha:]]/)
end

def is_upper?(string)
  string == string.upcase
end

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
