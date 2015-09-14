def enter_number
  puts "Please enter a number:"
end

def type_of_operation
  puts "Please enter a command:"
  puts " add\n subtract\n multiply\n divide"
end


ask_again=" "
while ask_again != 'no'

  enter_number
  num1=gets.chomp
  until num1 =~ /\d+/
  puts "Please enter a valid number only." # or use a resuce command   result = Integer(gets.chomp) rescue nil
                                                                       # while result == nil do
                                                                       # puts "Oops! You have entered a non-numeric value, Try Again"
                                                                       # result = Integer(gets.chomp) rescue nil
  num1=gets.chomp
  end
  
  enter_number
  num2=gets.chomp
  until num2 =~ /\d+/
  puts "Please enter a valid number only."
  num2=gets.chomp
  end

  type_of_operation
  command=gets.chomp
  
  if command == "add"
    result = num1.to_f + num2.to_f
  elsif command == "subtract"
    result = num1.to_f - num2.to_f
  elsif command == "multiply"
    result = num1.to_f * num2.to_f
  elsif command == "divide"
    result= num1.to_f / num2.to_f
  end

  puts "Your result is: #{result}"

  puts "Would you like to try another calculation? (yes/no)"
  ask_again=gets.chomp
    if ask_again == 'yes'
      puts "Begin Calculating...."
    else 
      puts "You have chosen to exit the program. Good-Bye"
    end

end