puts "Welcome to the game!"

CHOICES=["rock", "paper", "scissors"]

ask_again = " "
while ask_again != 'no'

begin
puts "Choose one: (rock/paper/scissors)"
player_choice=gets.chomp
end until CHOICES.include?(player_choice)

computer_choice=CHOICES.sample

if player_choice == computer_choice
  puts "Tie!"
elsif (player_choice == 'paper' && computer_choice == 'rock') || (player_choice=='rock' && computer_choice== 'scissors') ||(player_choice == 'scissors' && computer_choice=='paper')
  puts "Congratulations! You win!"
else
  puts "Bummer. Computer Wins."
end

puts "would you like to play again? (yes/no)"
ask_again=gets.chomp
if ask_again == 'yes'
  puts "Game is starting over...."
else
  puts "Good-Bye"
end
end
