# this program will not run unless you hit enter on the keyboard
def enter_number()
  puts "Please enter a number:"
  return
end

def type_of_operation()
  puts "Please enter a command:"
  puts " add\n subtract\n multiply\n divide"
  return
end

=begin 
when my while loop is here, and I ask the question from line 43, answering yes works, answering no does not break the loop until it runs the program one more time

ask_again=" "
while ask_again != 'no'
ask_again=gets.chomp
  if ask_again == 'yes'
    puts "Begin Calculating...."
  end
=end

  enter_number()
  num1=gets.chomp
  
  enter_number()
  num2=gets.chomp

  type_of_operation()
  command=gets.chomp
  
 
  if command == "add"
    result = num1.to_i + num2.to_i
  elsif command == "subtract"
    result = num1.to_i - num2.to_i
  elsif command == "multiply"
    result = num1.to_i * num2.to_i
  elsif command == "divide"
    result= num1.to_f / num2.to_f
  end

puts "Your result is: #{result}"

puts "Would you like to try another calculation? (yes/no)"
# with my loop here, answering no works fine, but answering yes does nothing
ask_again=" " 
while ask_again != 'no'
ask_again=gets.chomp
  if ask_again == 'yes'
    puts "Begin Calculating...."
  end
if ask_again == 'no'
  puts "You have chosen to exit the program. Good-Bye"
end

end