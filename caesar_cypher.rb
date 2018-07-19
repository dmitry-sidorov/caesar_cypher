class String
  def is_upper?
    self == self.upcase
  end
  def is_lower?
    self == self.downcase
  end
end

def caesar_cypher(phrase, shift)
  words = phrase.split.map { |word| word.split(//) }
  puts "Words: #{words}"
  punctuation_marks = words.map! { |word| word.reject! { |letter| letter["/[^a-zA-Z]/"] }}
  puts "Punctuation marks: #{punctuation_marks}"
  case_mask = words.map { |word| word.map { |letter| letter.is_upper? ? true : false }}
  puts "Case mask array: #{case_mask}"
  alphabet = ("a".."z").to_a
  indexes = words.map { |word| word.map { |letter| alphabet.index letter.downcase }}
  puts "Indexes: #{indexes}"
  crypted_words = indexes.map! { |word| word.map! { |index| alphabet.rotate(shift)[index] }}
  puts "Crypted message: #{crypted_words}"
  puts "crypted_words[0]: #{crypted_words[0].length}"
  (0...crypted_words.length).each do |i|
    (0...crypted_words[i].length).each do |j|
      crypted_words[i][j].swapcase! if case_mask[i][j]
    end
  end
  # for i in (0...crypted_words.length)
  #   for j in (0...crypted_words[i].length)
  #     crypted_words[i][j].swapcase! if case_mask[i][j]
  #   end
  # end



  puts "Crypted message with capitals: #{crypted_words}"
  crypted_phrase = crypted_words.map { |word| word.join }.join(' ')
  puts "Crypted message to_s: #{crypted_phrase}"
end

puts 'Enter phrase:'
user_input = gets.chomp
puts 'Enter shift value:'
shift = gets.chomp.to_i
caesar_cypher(user_input, shift)
