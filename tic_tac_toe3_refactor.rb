module Announcments
  def announce_winner
    p "#{winner} has won!"
  end
  
  def announce_draw
    p "Draw!" if winner.nil?
  end
end

module Check_move

  def dont_cheat
    p "don't cheat"
  end
  
  def verify_input(move)
    return move if board_free?(move) && move_in_range?(move) #&& dont_cheat
  end

  def board_free?(move)
    p board_state[move].nil?
  end

  def move_in_range?(move)
    p move.to_i.between?(1,9)
  end

end


class Game
include Announcments, Check_move
attr_accessor :board_state, :free_spaces, :curr_player, :winner, :move,
PLAYER1 = "O"
PLAYER2 = "X"
WINNING_LINES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]] 
BOARD_RANGE = (1..9)

def display_board
line = "-----------"
" #{board_state[1] || " "} | #{board_state[2] || " "} | #{board_state[3] || " "}
#{line}
 #{board_state[4] || " "} | #{board_state[5] || " "} | #{board_state[6] || " "}
#{line}
 #{board_state[7] || " "} | #{board_state[8] || " "} | #{board_state[9] || " "} \n"
end

def print_board
  print display_board
end

def initialize (move = 0, curr_player = PLAYER1, free_spaces = 0, board_state = new_array)
  @move = move#po co? - a moze przydatne jako prev_move?
  @winner = "" #po co - pochodne current_player
  @curr_player = curr_player
  @free_spaces = free_spaces#po co? pochodne board_state
  @board_state = board_state
end

def new_array
  Array.new(10)
end

def count_nils
    board_state.reduce(0) do |sum, number|
    number == nil ? sum += 1 : sum += 0
    sum
    end
end

def free_spaces_count # po co? uzyj tylko count nils?
  self.free_spaces = count_nils
end

def who_plays?
  self.curr_player = count_nils.even? ? PLAYER1 : PLAYER2
end

def check_win
  WINNING_LINES.any? do |line|
  board_state[line[0]] == board_state[line[1]] && board_state[line[0]] == board_state[line[2]] ? self.winner = board_state[line[0]] : false
  end
end

def player_alias
  curr_player == "O" ? "Player1" : "Player2"
end

def getting_move
  print "pick a move - 1 to 9 \n#{player_alias} picks: "
  gets.chomp.to_i
end

def get_move
  #ciag metod do otrzymania valid move
  loop do
    user_input = getting_move
    valid_input = verify_input(user_input)
    break valid_input if valid_input#.integer?  #in looop until we get number beetwen 1-9 and not invalid
  
    p "loopin2g"
  end
end

def add_move(move_new)
  board_state[move_new] = @curr_player
end

def round_play
  print_board
  until count_nils == 1
  who_plays?
  move_new = get_move
  add_move(move_new)
  print_board
  break announce_winner if check_win

  end
  announce_draw
end
end



gra = Game.new
gra.round_play