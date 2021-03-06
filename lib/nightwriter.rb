require './lib/translator'

first, second = ARGV

input_file = File.open(first)
output_file = File.open(second, 'w')

string = input_file.readline

translator = Translator.new
braille = translator.to_braille(string)
count = 0
3.times do |i|
  output_file.write(braille[i])
  count += braille[i].length
  output_file.write("\n")
end

output_file.close

p "Created '#{ARGV[1]}' from '#{ARGV[0]}'! -----> Contains #{count} characters.'"