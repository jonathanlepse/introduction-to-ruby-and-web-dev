class Hand
  include Comparable
  
  attr_reader :value
  
  def initialize(v)
    @value=v
  end
  
  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value=='p' && another_hand.value == 'r') || (@value=='r' && another_hand.value == 's') || (@value=='s' && another_hand.value == 'p') 
      1
    else
      -1
    end
  end
  
  def display_winning_message
    case @value
    when 'p'
      puts "Paper wraps rock."
    when 'r'
      puts "rock covers sciccors"
    when 's'
      puts "sciccsors cuts paper"
    end
  end
end

class Player
  attr_accessor :hand
  attr_reader :name
  
  def initialize(n)
    @name=n
  end
  
  def to_s
    puts "#{name} currently has a choice of #{self.hand.value}"
  end

end

class Human < Player
  def pick_hand
    begin
    puts "pick one: (r,p,s)"
    c=gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)
    
    self.hand = Hand.new(c) # you havent gotten a value yet for hand so you have to call the setter method self.hand in order to get a value than later in your code you can call hand from the getter method
  end
end

class Computer < Player
  def pick_hand
    self.hand=Hand.new(Game::CHOICES.keys.sample) # you havent gotten a value yet for hand so you have to call the setter method  self.hand in order to get a value than later in your code you can call hand from the getter method
  end
end

class Game 
  CHOICES = {'p'=> "Paper", 'r'=> 'Rock', 's'=> "Scissors"}
  
  attr_reader :player, :computer
  
  def initialize
    @player=Human.new('bob') # rememeber human inherited players initialze method
    @computer=Computer.new('R2D2') # rememeber computer inherited players initialize method
  end
  
  def compare_hands
    if player.hand == computer.hand # referenceing the hand getter method here b/c you have access to it b/c you set it on line 53 and 59
      puts "It's a Tie."
    elsif player.hand > computer.hand
      player.hand.display_winning_message
      puts "#{player} won!"
    else
      computer.hand.display_winning_message
      puts "#{computer} won!"
    end
  end
  
  def play
    loop do
    player.pick_hand
    computer.pick_hand
    compare_hands
    puts "Play Again? (y/n)"
    play_again=gets.chomp.downcase
    break if play_again == 'n'
    end
  end
end

puts Game.ancestors
