require "pry"
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  

  def won?(board)
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " ",]
      false
    elsif board[WIN_COMBINATIONS[0][0]] == "X" && board[WIN_COMBINATIONS[0][1]] == "X" && board[WIN_COMBINATIONS[0][2]] == "X"
      WIN_COMBINATIONS[0]
    elsif board[WIN_COMBINATIONS[1][0]] == "X" && board[WIN_COMBINATIONS[1][1]] == "X" && board[WIN_COMBINATIONS[1][2]] == "X"
      WIN_COMBINATIONS[1]
    elsif board[WIN_COMBINATIONS[2][0]] == "X" && board[WIN_COMBINATIONS[2][1]] == "X" && board[WIN_COMBINATIONS[2][2]] == "X"
      WIN_COMBINATIONS[2] 
    elsif board[WIN_COMBINATIONS[3][0]] == "X" && board[WIN_COMBINATIONS[3][1]] == "X" && board[WIN_COMBINATIONS[3][2]] == "X"
      WIN_COMBINATIONS[3]
    elsif board[WIN_COMBINATIONS[4][0]] == "X" && board[WIN_COMBINATIONS[4][1]] == "X" && board[WIN_COMBINATIONS[4][2]] == "X"
      WIN_COMBINATIONS[4]
    elsif board[WIN_COMBINATIONS[5][0]] == "X" && board[WIN_COMBINATIONS[5][1]] == "X" && board[WIN_COMBINATIONS[5][2]] == "X"
      WIN_COMBINATIONS[5]
    elsif board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
      WIN_COMBINATIONS[6]
    elsif board[WIN_COMBINATIONS[7][0]] == "X" && board[WIN_COMBINATIONS[7][1]] == "X" && board[WIN_COMBINATIONS[7][2]] == "X"
      WIN_COMBINATIONS[7]
    elsif board[WIN_COMBINATIONS[0][0]] == "O" && board[WIN_COMBINATIONS[0][1]] == "O" && board[WIN_COMBINATIONS[0][2]] == "O"
      WIN_COMBINATIONS[0]
    elsif board[WIN_COMBINATIONS[1][0]] == "O" && board[WIN_COMBINATIONS[1][1]] == "O" && board[WIN_COMBINATIONS[1][2]] == "O"
      WIN_COMBINATIONS[1]
    elsif board[WIN_COMBINATIONS[2][0]] == "O" && board[WIN_COMBINATIONS[2][1]] == "O" && board[WIN_COMBINATIONS[2][2]] == "O"
      WIN_COMBINATIONS[2] 
    elsif board[WIN_COMBINATIONS[3][0]] == "O" && board[WIN_COMBINATIONS[3][1]] == "O" && board[WIN_COMBINATIONS[3][2]] == "O"
      WIN_COMBINATIONS[3]
    elsif board[WIN_COMBINATIONS[4][0]] == "O" && board[WIN_COMBINATIONS[4][1]] == "O" && board[WIN_COMBINATIONS[4][2]] == "O"
      WIN_COMBINATIONS[4]
    elsif board[WIN_COMBINATIONS[5][0]] == "O" && board[WIN_COMBINATIONS[5][1]] == "O" && board[WIN_COMBINATIONS[5][2]] == "O"
      WIN_COMBINATIONS[5]
    elsif board[WIN_COMBINATIONS[6][0]] == "O" && board[WIN_COMBINATIONS[6][1]] == "O" && board[WIN_COMBINATIONS[6][2]] == "O"
      WIN_COMBINATIONS[6]
    elsif board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
      WIN_COMBINATIONS[7]
    end
  end 
  
  def full?(board)
    board.all?{|token| token == "X" || token == "O"}
  end 
  
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  def over?(board)
    if won?(board) || draw?(board) 
      true
    else
      false
    end
  end
  
  def winner(board)
    if winning_combo = won?(board)
      board[winning_combo.first]
    end
  end

  def position_taken?(board, position)
    if (board[position] ==  " " || board[position] == "" || board[position] == nil)
        false
    else
        true
    end
end 

def turn_count(board)
    board.count{ |token| token == "X" || token == "O"}
  end
  
  def current_player(board)
      turn_count(board) % 2 == 0? "X" : "O"
  end

  def valid_move?(board, position)
    #binding.pry
    if position_taken?(board, position) || position < 0 || position > 8
        false
    else
        true
    end
end 

def input_to_index(string)
    @choose =string.to_i-1
end

def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    if valid_move?(board, position)
      move(board, position, current_player(board))
      display_board(board)
    else 
        turn(board)
    end
  end

  def play(board)
    turn(board) until over?(board)
    if won?(board)
        puts "Congratulations #{winner(board)}!"
    elsif draw?(board) 
        puts "Cat's Game!"
    end
  end

  def move(board, position, token)
  board[position] = token
  end


