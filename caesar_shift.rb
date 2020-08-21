def caesar_cipher(string, shift)
  #  convert the string to an array of ANSI number codes
  array = string.bytes

  # create an array of character strings which are shifted
  shifted_array = array.map do |char|
    # store the character's case (upper, lower, or nil 'not a string')
    char_case = determine_case(char)

    # shift the character unless it's not a letter, and ignore shift values exceeding 26 via modulus
    char += shift % 26 unless char_case.nil?

    # wrap the ANSI code depending on if it's upper or lower case. The value will only wrap if it exceeds teh bounds passed to the wrap_code function
    if char_case == 'upper'
      char = wrap_code(65, 90, char)
    elsif char_case == 'lower'
      char = wrap_code(97, 122, char)
    end

    # turn the ANSI character code back into a string
    char.chr
  end

  # return the shifted array as a string
  p shifted_array.join
end

# determine if the ANSI character code is a capital, lowercase, or non-character
def determine_case(char)
  char_case = if char.between?(65, 90)
                'upper'
              elsif char.between?(97, 122)
                'lower'
              end
end

# wrap the ANSI code by 26 if it exceeds the bounds passed to it
def wrap_code(lower_bound, upper_bound, char)
  if char < lower_bound
    char += 26
  elsif char > upper_bound
    char -= 26
  else
    char
  end
end

caesar_cipher('What a string!', 5)
