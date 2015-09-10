def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' ' } # you can't hard code this hash here b/c you need to use board[position]= whatever elsewhere in the program
  board # this hash here is going to be filled up each time it is passed into another method, thats why it is stored in a board variable on line 58
end

def empty_positions(board)
  board.keys.select {|position| board[position] == ' '} # this is saying select each postion that is empty
end

def player_places_piece(board) # board variable gets passed in (line 61) player pick gets stored in the variable, and the changed variable gets passed in somewhere else to be changed again
  begin
    puts "Choose a position (from 1 to 9) to place a piece:"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = 'X'
end

def computer_places_piece(board)
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board) # these are the winning lines, 3 X or 3 O in a row wins
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def nine_positions_are_filled?(board)
  empty_positions(board) == [] # this is an array b/c in the empty position method we called keys.select which returns an array
end

def announce_winner(winner)
  puts "#{winner} won!"
end

def draw_board(board)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts
end

board = initialize_board # this variable represents the currenly blank hash from line 4
draw_board(board) # each time you pass in this board variable, it will be passed in changed from the previous time
begin
  player_places_piece(board) # blank board is passed in here, the player pick will remain with this board variable now
  draw_board(board) # board redrawn with player pick stored
  computer_places_piece(board) # board is passed in with a pick drawn in
  draw_board(board) # board redrawn with computer pick stored
  winner = check_winner(board) # board is passed in the check winner with pick stored on it
end until winner || nine_positions_are_filled?(board)
if winner
  announce_winner(winner)
else
  puts "It's a tie."
end