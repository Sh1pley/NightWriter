require './lib/translator'

first, second = ARGV

input_file = File.open(first)
line_1 = input_file.readline.chomp
line_2 = input_file.readline.chomp
line_3 = input_file.readline.chomp

length = line_1.length
ordered_line = ""
(0..length-1).step(2) do |index|
  ordered_line << line_1[index]
  ordered_line << line_1[index+1]
  ordered_line << line_2[index]
  ordered_line << line_2[index+1]
  ordered_line << line_3[index]
  ordered_line << line_3[index+1]
end

output_file = open(second, 'w')
translator = Translator.new
output_text = translator.to_alpha(ordered_line)
output_file.write(output_text)
output_file.close

p "Created '#{ARGV[1]}' from '#{ARGV[0]}'! -----> Contains #{output_text.length} characters.'"

