def calculate_total(cards)
  arr = cards.map { |e| e[0] }

  total=0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # or value == "J" || "Q" || "K" , then you can drop the to_i on this line only. jqk = 0 by default when you convert to to_i thats why ==0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select { |e| e == "A"}.count.times do
    if total > 21
      total -= 10
    end
  end

  total
end

play_again = " "
while play_again != 'no'

  cards=['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  suits=['H', 'D', 'S', 'C']

  deck=cards.product(suits)
  deck.shuffle!# deck permanently shuffled.

#deal

  my_cards=[]# initialze both of these variables
  dealer_cards=[]

  my_cards << deck.pop # altering the deck varibale permanently everytime you use pop and push
  dealer_cards << deck.pop 
  my_cards << deck.pop
  dealer_cards << deck.pop
  #calculate
  dealer_total=calculate_total(dealer_cards)
  my_total= calculate_total(my_cards) # begin end until stay || bust if bust puts winning message, break

#show
  puts "Dealer has #{dealer_cards[0]} and #{dealer_cards[1]}} for a total of #{dealer_total}"
  puts "You have #{my_cards[0]} and #{my_cards[1]} for a total of #{my_total}"

  if my_total == 21
  puts "Blackjack! You win"
  break
  end# an exit command ends the program, you can use it just like you would break or next 

  while my_total < 21
   puts "What would you like to do? 1) hit 2) stay"
    hit_or_stay = gets.chomp
  
    if hit_or_stay == "1"
      new_card = deck.pop
     puts "Dealing your card....#{new_card}"
      my_cards << new_card
      my_total = calculate_total(my_cards)
      puts "You new total is #{my_total}"
      if my_total > 21
        puts "BUST! You lose."
        break
      elsif my_total == 21
        puts "Blackjack! You win!"
        break
      end
      
    elsif hit_or_stay == "2"
      puts "You chose to stay. Dealer's turn."
      break
    
    else !['1','2'].include?(hit_or_stay)
      puts "You must choose 1 or 2 only."
      next
    end
  end

  if dealer_total == 21
    puts "Dealer has Blackjack. You Lose."
    break
  end

  while dealer_total < 17
    dealer_new_card = deck.pop
    puts "Dealers new card is: #{dealer_new_card}"
    dealer_cards << dealer_new_card
    dealer_total = calculate_total(dealer_cards)
    puts "Dealer's new total is #{dealer_total}"
    if dealer_total > 21
      puts " Dealer Busts. You Win!"
    end
  end

  if dealer_total > my_total && dealer_total < 21
    puts "Dealer has: #{dealer_total} and you have: #{my_total} The house wins sucker!!! Don't you know the house always wins. MUAHAHAHA!"
  elsif dealer_total < my_total && my_total < 21
    puts "Dealer has: #{dealer_total} and you have: #{my_total}. Congratulations! We have a winner!"
  elsif dealer_total == my_total
    puts "Push, its a tie. The house wins by default because the house always wins."
  end

puts "Would you like to play another hand?(yes/no)"
play_again = gets.chomp
loop_counter=0
if play_again == 'yes'
   loop_counter +=1
   if loop_counter == 5
     puts "Seek help. Your not allowed to play again at this moment."
     break
   end
  puts "Looks like we got a card shark on our hands......Lets play again."
elsif play_again == 'no'
  puts "Didn't think so chump. Hit the bricks."
else
  puts "You must choose yes or no, otherwise casino security is gonna rough you up on the way out."
end
end
