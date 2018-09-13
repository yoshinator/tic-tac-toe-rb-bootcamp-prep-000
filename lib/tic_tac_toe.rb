BOARD = ["X","X","X","X","X","X","O ","O","X"]
WIN_COMBINATIONS =[
    [0,1,2], #top row 
    [3,4,5],
    [6,7,8], 
    [0,3,6],  #left Column
    [1,4,7], 
    [2,5,8], 
    [0,4,8], #left diagnol 
    [2,4,6]
  ]

# Helper Methods
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  i = 0 
  until i > 8 
    turn(board)
     i+=1
  end
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  sam_ex = []
  sam_oh = []
  i = 0
  board.each do |index|
    if index == "X"
      sam_ex.push(i)
    elsif index == "O"
      sam_oh.push(i)
    end
    i+=1
  end
  WIN_COMBINATIONS.each do |combination|
    if combination&sam_oh == combination || combination&sam_ex ==combination
    return  combination
    end
  end
nil
end


def full?(board)
  if board.all?{|token| token == "X" || token =="O"}
    true #if all elements of board have a token that = X or O return true for a draw
  else 
    false  #game is in progress 
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end
  
def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  won?(board)
  if won?(board)
   board[won?(board)[0]]
  end
end  
#same as turn_count
def number_of_turns_taken(board)
  counter = 0
  board.each do |token| 
    if token == "X" || token =="O"
      counter +=1
    end
  end
  counter
end


# does not allow for a default third argument
# takes three arguments: board, position, and player token
# allows "X" player in the bottom right and "O" in the top left 
#player_move
def player_move(board, index, current_player)
  board[index] = current_player
end

def turn_count(board)
  counter = 0
  board.each do |token| 
    if token == "X" || token =="O"
      counter +=1
    end
  end
  counter
end

def current_player(board)
  turn_count(board)
  if turn_count(board) %2 == 0
    "O"
  else
    "X"
  end 
end 
