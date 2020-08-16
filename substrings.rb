def substrings (words, dictionary)
    result = Hash.new(0)

    dictionary.index(words) != nil ? result[words] += 1 : result[words] = 0
    return p result # Hash listing each substring that was found, and how many times it exists in the dictionary.
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)