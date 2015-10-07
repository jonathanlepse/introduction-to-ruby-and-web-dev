class Hand
  include Comparable
  
  attr_reader :value
  
  def initialize(v)
    @value = v
  end
  
  def <=>(another_hand)
    if @value == another_hand.value
      0
    elsif (@value =='p' && another_hand.value == 'r') || 
          (@value =='r' && another_hand.value == 's') || 
          (@value =='s' && another_hand.value == 'p') 
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
    choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(choice)
    
    self.hand = Hand.new(choice) # you havent gotten a value yet for hand so you have to call the setter method self.hand in order to get a value than later in your code you can call hand from the getter method in player on line 35 and reference it for use on line 76
  end
end

class Computer < Player
  def pick_hand
    self.hand=Hand.new(Game::CHOICES.keys.sample) # you havent gotten a value yet for hand so you have to call the setter method  self.hand in order to get a value than later in your code you can call hand from the getter method in player on line 35 and reference it for use on line 82
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
    if player.hand == computer.hand # here you are referencing the hand getter method which you have access to b/c player is an object of Human class, player has access to all of Humans instance method and Human inherits from Player class so hand is the getter method from player which human has access to.
      puts "It's a Tie."
    elsif player.hand > computer.hand
      player.hand.display_winning_message# here you want the player object to have access to the Hand class instance method display_winning_message, in order to do so you need to CLIMB THE LADDER, the hand object has access to dispaly_winning_message, that object was created in the Human class so you have to call the computer object on the hand object which is then calling the display_winnning_message insatnce method.
      puts "#{player.name} won!"
    else
      computer.hand.display_winning_message # here you want the computer object to have access to the Hand class instance method display_winning_message, in order to do so you need to CLIMB THE LADDER, the hand object has access to dispaly_winning_message, that object was created in the Computer class so you have to call the computer object on the hand object which is then calling the display_winnning_message insatnce method.
      puts "#{computer.name} won!"
    end
  end
  
  def play
    loop do
    player.pick_hand # player is an object of Human class so it has access to Humans instance methods (pick_hand is an instance method of Human class)
    computer.pick_hand
    compare_hands # this method contains the player and computer objects which have access to hand object which is how in this method you can call hands instance methods
    puts "Play Again? (y/n)"
    play_again=gets.chomp.downcase
    break if play_again == 'n'
    end
  end
end

game = Game.new.play # this just saves a line instead of writing on the next line game.play



