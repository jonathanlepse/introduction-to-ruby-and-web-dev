=begin
1)ask user for a number 
2)ask user for another number
3) if user enters an invalid character go back to question
4) perform calculation on both numbers
=end


puts "Please enter your first number"
num1= gets.chomp

puts "Please enter your second number"
num2=gets.chomp

puts "Please choose an operation: add, subtract, multiply, divide"
operation=gets.chomp

if operation == "add"
  result = num1.to_i + num2.to_i
elsif operation == "subtract"
  result = num1.to_i - num2.to_i
elsif operation == "multiply"
  result = num1.to_i * num2.to_i
elsif operation == "divide"
  result= num1.to_f / num2.to_f
end

puts "Your result is #{result}"

