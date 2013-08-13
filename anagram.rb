class Anagram
  def initialize(word)
    # Ensures that the word entered is always case insensitive
    @word = word.downcase
  end

  def match(array)
    # Creates a hash where each key is an array of every letter in the word, 
    # and the values are an array of all the words that contain those letters
    # and only those letters.
    @words_hash = array.each_with_object(Hash.new []) do |word, hash|
      hash[word.chars.sort] += [word]
    end
    
    # Creates an array of the original word, sorted by letter
    @sorted_word = @word.chars.sort
    
    anagrams = []
    # Iterates through each pair from the hash created above
    # If the array of letters from the key matches the sorted letters,
    # Iterates through the array of matched words and adds those words
    # To the anagrams array
    @words_hash.each_pair do |key, value|
      if key == @sorted_word
        value.each do |v|
          anagrams << v
        end
      end
    end
    return anagrams
  end
end