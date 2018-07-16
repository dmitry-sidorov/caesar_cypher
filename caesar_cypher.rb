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
  case_mask = words.map { |word| word.map { |letter| letter.is_upper? ? true : false }}
  puts "Case mask array: #{case_mask}"
  alphabet = ("a".."z").to_a
  indexes = words.map { |word| word.map { |letter| alphabet.index letter.downcase }}
  puts "Indexes: #{indexes}"
  # indexes.map! { |word| word.map! { |index| index + shift }}
  # puts "Shifted indexes: #{indexes}"
  crypted = indexes.map! { |word| word.map! { |index| alphabet.rotate(shift)[index] }}
  puts "Crypted message: #{crypted}"
  case_fix(words, crypted)
  crypted_phrase = crypted.map { |word| word.join }.join(' ')
  puts crypted_phrase.inspect
end

def case_compare (standard, comparable)
  if (standard.is_upper? && comparable.is_lower?) || (standard.is_lower? && comparable.is_upper?)
    comparable.switchcase!
  end
end

def case_fix (standards, comparables)
  for i in standards
    for j in standards[i]
      case_compare(standards[j], comparables[j])
    end
  end
end

puts 'Enter phrase:'
user_input = gets.chomp
puts 'Enter shift value:'
shift = gets.chomp.to_i
caesar_cypher(user_input, shift)
