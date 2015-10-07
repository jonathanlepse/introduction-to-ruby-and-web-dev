require 'pry'

class Card
  attr_accessor :suit, :face_value
  
  def initialize(suit, face_value)
    @suit = suit
    @face_value = face_value
  end
  
  def pretty_output
    "The #{face_value} of #{find_suit}"
  end
  
  def find_suit
    return_value= case suit
                    when "H" then "Hearts"
                    when 'D' then "Diamonds"
                    when "S" then "Spades"
                    when "C" then "Clubs"
                  end 
    return_value
  end 
  
  def to_s # in order to access this to_s you have to climb the ladder a card object was created in the Deck Class so you need a deck object to be able to call this object like so : deck.cards
    pretty_output # when you string interpolate the object this returns
  end
end

class Deck
  attr_accessor :cards
  
  def initialize
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
        @cards << Card.new(suit, face_value) # these arguments come from the blocks in these iterators not Card Class attr_accessor
    end 
    end 
    scramble!
  end
   #binding.pry
  
  def scramble!
    cards.shuffle! # all of these methods happen to be instance methods of array so thats how we can call them here they are not instacne methods of the Card class although b/c we instantitaed an a card object in this Deck class we can call the Card instance methods as well.
  end
  
  def deal_a_card
    cards.pop
  end 
  
  def size
    cards.size
  end 
end 

module Hand
  
  def show_hand
    puts "-----#{name}'s Hand:-----"
    cards.each do |card|
      puts "==> #{card}"
    end 
    puts "Total: #{calculate_total}"
  end 
  
  def calculate_total
    face_values = cards.map { |card| card.face_value}
    
    total = 0
    face_values.each do |val|
      if val == "A"
        total += 11
      else
       total+= (val.to_i == 0 ? 10 : val.to_i)
      end 
    end
    
    face_values.select {|val| val == "A"}.count.times do
      break if total <= 21 # no end command needed if break command listed
        total -= 10
      end 
    total
  end 
  
  def add_card(new_card)
    cards << new_card
  end
  
  def is_busted?
    calculate_total > Blackjack::BLACKJACK_AMOUNT
  end 

end

class Player
  include Hand
  
  attr_accessor :name, :cards
  
  def initialize(name)
    @name = name
    @cards = []
  end
end 

class Dealer
  include Hand
  
  attr_accessor :name, :cards
  
  def initialize
    @name = "Dealer"
    @cards = []
  end
  
  def show_flop
    puts "-----Dealer's Hand-----"
    puts "First Card is The *** of ***"
    puts "Second Card is #{cards[1]}"
  end
end 

class Blackjack
  attr_accessor :player, :dealer, :deck
  
  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17
  
  def initialize 
    @player = Player.new("Player1")
    @dealer = Dealer.new
    @deck = Deck.new
  end
  
  def set_player_name
    puts "What's your name?"
    self.player.name = gets.chomp
  end
  
  def deal_cards
    2.times {player.add_card(deck.deal_a_card)}
    2.times {dealer.add_card(deck.deal_a_card)}
  end
  
  def show_flop
    player.show_hand
    dealer.show_flop
  end
  
  def blackjack_or_bust(player_or_dealer)
    if player_or_dealer.calculate_total == BLACKJACK_AMOUNT 
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry Dealer hit blackjack. #{player.name} loses."
      else
        puts "Congratulations you hit blackjack. #{player.name} wins!"
      end
      play_again?
    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Dealer)
        puts "Congratulations the dealer busted #{player.name} wins."
      else
        puts "Sorry you lose. #{player.name} busted."
      end
      play_again?
    end
  end
  
  def player_turn
    puts " "
    puts "#{player.name}'s turn."
    
    blackjack_or_bust(player)
    
    while !player.is_busted?
      puts "What do you want to do? 1) hit  2) stay"
      answer = gets.chomp
      
      if !['1', '2'].include?(answer)
        puts "You must choose '1' or '2'."
        next
      end
        
      if answer == '2'
        puts "#{player.name} chose to stay."
        break
      end
      
      new_card = deck.deal_a_card
      puts "Dealing a card to #{player.name} : #{new_card}"
      player.add_card(new_card)
      puts "#{player.name}'s new total is: #{player.calculate_total}"
    
      blackjack_or_bust(player)
    end
    puts "#{player.name} stays at #{player.calculate_total}"
  end
  
  def dealer_turn
    puts "Dealer's turn"
    
    blackjack_or_bust(dealer)
    while dealer.calculate_total < DEALER_HIT_MIN
      new_card = deck.deal_a_card
      puts "Dealing crad to dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer's total is now: #{dealer.calculate_total}"
    
      blackjack_or_bust(dealer)
    end
    
    puts "Dealer'stays at #{dealer.calculate_total}"
  end
  
  def who_won?
    if player.calculate_total > dealer.calculate_total
      puts "Congratulations #{player.name} wins!"
    elsif dealer.calculate_total > player.calculate_total
      puts "Sorry the Dealer wins."
    else
      puts "PUSH...It's a tie."
    end
    play_again?
  end
  
  def play_again?
    puts "Would you like to play again? (y/n)"
    if gets.chomp == 'y'
      puts "Starting New Game."
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Thanks for playing."
      exit
    end
  end
  
  
  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
    play_again?
  end
end

Blackjack.new.start



