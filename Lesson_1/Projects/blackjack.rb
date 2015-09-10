def calculate_total(cards)
end

cards=['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suits=['H', 'D', 'S', 'C']

deck=cards.product(suits)
deck.shuffle!

#deal

my_cards=[]
dealer_cards=[]

my_cards << deck.pop
dealer_cards << deck.pop # begin end until stay || bust if bust puts winning message, break
my_cards << deck.pop
dealer_cards << deck.pop

#calculate

dealer_total=calculate_total(dealer_cards)
my_total= calculate_total(my_cards)

#show
puts "Dealer has #{dealer_cards[0]} and #{dealer_cards[1]}} for a total of #{dealer_total}"
puts "You have #{my_cards[0]} and #{my_cards[1]} for a total of #{my_total}"
puts "What would you like to do? 1)hit 2)stay"
hit_or_stay = gets.chomp
