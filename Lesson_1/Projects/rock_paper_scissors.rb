puts "Welcome to the game!"

CHOICES=["rock", "paper", "scissors"]

loop do
puts "Choose one: (rock/paper/scissors)"
player_choice=gets.chomp
break if CHOICES.include?(player_choice)
puts "Please pick only rock, paper or scissors"
end

computer_choice=CHOICES.sample

if player_choice == computer_choice
  puts "Tie!"
elsif (player_choice == 'paper' && computer_choice == 'rock') || (player_choice=='rock' && computer_choice== 'scissors') ||(player_choice == 'scissors' && computer_choice=='paper')
  puts "Congratulations! You win!"
else
  puts "Bummer. Computer Wins."
end

