
def enter_number()
  puts "Please enter a number:"
  return
end

def type_of_operation()
  puts "Please enter a command"
  puts " add\n subtract\n multiply\n divide\n exit"
  return
end

while true

  enter_number()
  num1=gets.chomp
  
  enter_number()
  num2=gets.chomp

  type_of_operation()
  command=gets.chomp
  
  if command == 'exit'
    puts "You have chosen to exit this program. Good-Bye."
    break
  end



  if command == "add"
    result = num1.to_i + num2.to_i
  elsif command == "subtract"
    result = num1.to_i - num2.to_i
  elsif command == "multiply"
    result = num1.to_i * num2.to_i
  elsif command == "divide"
    result= num1.to_f / num2.to_f
  else
    result="You have chosen to end the program. Good-Bye"
  end

puts "RESULT: #{result}"

end
