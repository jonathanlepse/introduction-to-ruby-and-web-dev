puts "Welcome to the game!"

CHOICES=["rock", "paper", "scissors"]

def winning_message(winning_choice)
  case winning_choice
  when 'paper'
    puts "Paper cover rock."
  when 'rock'
    puts "Rock smashes scissors"
  when 'scissors'
    puts "Scissors cuts paper"
  end
end

def tie_message(winning_choice)
  case winning_choice
  when 'paper'
    puts "You both chose paper."
  when 'rock'
    puts "You both chose rock."
  when 'scissors'
    puts "You both chose scissors"
  end
end
  
ask_again = " "
while ask_again != 'no'

begin
puts "Choose one: (rock/paper/scissors)"
player_choice=gets.chomp
end until CHOICES.include?(player_choice)

computer_choice=CHOICES.sample

if player_choice == computer_choice
  tie_message(player_choice)
  puts "It's a Tie!"
elsif (player_choice == 'paper' && computer_choice == 'rock') || (player_choice=='rock' && computer_choice== 'scissors') ||(player_choice == 'scissors' && computer_choice=='paper')
  winning_message(player_choice)
  puts "Congratulations! You win!"
else
  winning_message(computer_choice)
  puts "Bummer. Computer Wins."
end

puts "would you like to play again? (yes/no)"
ask_again=gets.chomp
if ask_again == 'yes'
  puts "Game is starting over...."
else
  puts "Good-Bye!"
end

end