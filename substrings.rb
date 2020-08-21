def substrings(words, dictionary)
  result = Hash.new(0)

  str_arr = convert_string(words)

  str_arr.each do |str|
    recursive_slice(str.downcase, dictionary, result)
    single_slice(str, dictionary, result)
  end

  p result # Hash listing each substring that was found, and how many times it exists in the dictionary.
end

# checks each individual character in a string and checks if it's in the dictionary
def single_slice(str, dictionary, result)
  str.each_char do |letter|
    increment_hash(letter, dictionary, result)
  end
end

# recursively runs the increment_hash on every substring combination except for single letters
def recursive_slice(substring, dictionary, result)
  if substring.length > 1
    increment_hash(substring, dictionary, result)
    recursive_slice(substring.slice(0, substring.length - 1), dictionary, result)
    recursive_slice(substring.slice(1, substring.length), dictionary, result)
  end
end

# converts the string  to an array separated by the parameters in the Regex
def convert_string(string)
  string.split(/[,!'? ]/)
end

# increments the value of the key if the word is in the dictionary
def increment_hash(word, dictionary, result)
  !dictionary.index(word).nil? ? result[word] += 1 : nil
end

dictionary = %w[below down go going horn how howdy it i low own part partner sit]
substrings("Howdy partner, sit down! How's it going?", dictionary)
