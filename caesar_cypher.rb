class String
  def is_upper?
    self == self.upcase
  end
end

user_input = gets.chomp
words = user_input.split.map { |word| word.split(//) }
puts words.inspect
uppercase_indexes = []
words.each do |word|
  word.each do |letter|
    uppercase_indexes.push (word.find_index) if letter.is_upper?
  end
end
puts uppercase_indexes.to_s
alphabet = ('a'..'z').to_a
indexes = []
