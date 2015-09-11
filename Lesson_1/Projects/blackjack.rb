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

my_total=my_total
dealer_total=dealer_total
if my_total == 21
  puts "Blackjack! You win"
  exit # an exit command ends the program, you can use it just like you would break or next 
end
if dealer_total == 21
  puts "Dealer Wins. HAHAHA the house always has the advantage!"
  exit
end


while my_total < 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp
  if hit_or_stay == "1"
    new_card = deck.pop
    puts "Dealing your card....#{new_card}"
    my_cards << new_card
    my_total= calculate_total(my_cards)
    puts "You new total is #{my_total}"
      if my_total > 21
        puts "BUST! you lose."
        exit
      end
  elsif hit_or_stay == "2"
  puts " You chose to stay. Dealer's turn."
    until dealer_total > 17
      dealer_new_card = deck.pop
      puts "Dealers card is:...#{dealer_new_card}"
      dealer_cards<< dealer_new_card
      dealer_total=calculate_total(dealer_cards)
      puts "Dealer's new total is: #{dealer_total}"
        if (dealer_total <= 21 && dealer_total > my_total)
          puts " Dealer total is #{dealer_total}, your total is #{my_total}"
          puts "Dealer Wins. HAHAHA the house always has the advantage!"
        elsif (my_total<=21 && my_total > dealer_total)
        puts "You have #{my_total}, the dealer has #{dealer_total}"
        puts "Congratulations! We have a winner!"
        end
    end
   break
  else !['1','2'].include?(hit_or_stay)
    puts "You must choose 1 or 2 only."
    next
  end
end



