=begin
dealer deals 2 cards to himself and player
player goes first decides to hit or stay
if player cards sum to 21 player wins # check total method goes insde this method
  if player cards sum to over 21 player loses
  else hit #check total
    stay #check total again
    if stay total of cards is saved 
dealers turn
dealer must hit until cards sum 17 or higher
if 21 wins
  if over 21 busts
    if dealer stays total value is saved
      compare the two hands higher value wins.
=end

def initialize_deck
  cards=["A","A","A","A","2",'2','2','2','3','3','3','3','4','4','4','4','5','5','5','5','6','6','6','6','7','7','7','7','8','8','8','8','9','9','9','9','10','10','10','10','J','J','J','J','Q','Q','Q','Q','K','K','K','K']
end

def deal(cards)
cards.shuffle!.pop
end
      
      
      
      

cards=initialize_deck


puts deal(cards)