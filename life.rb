require 'pp'
#row: number of rows, default is 5
#cols: number of coloums, default is 5
#generations: number of generations to run for, default is 20
#seed: precentace that a cell will be alive, default is 50
def life(rows = 5 , cols = 5, generations= 20, seed = 50)
  board = create_board(rows, cols, seed) 
  test_board = [[1,2,3,4,5],
                [6,7,8,9,10],
                [11,12,13,14,15],
                [16,17,18,19,20],
                [21,22,23,24,25]]
  board1 = [[0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,0,0,0],
            [0,0,1,0,0],
            [0,0,0,0,0]]
  #puts test_board[2][1]
  live(rows,cols,generations,board)
end

#height is number of rows
#width is number of cols
def create_board(height = 5, width = 5, seed = 50)
  board = Array.new(width) {Array.new(height,0)}
  for i in 0..height-1
    for j in 0..width-1
      num = rand(0..100)
      if num < seed
        board[i][j] = 1
      else
        board[i][j] = 0
      end
    end
  end
  return board
end
  
def print_board(board)
  pp board
end

def live(rows, cols, generations, board)
  if generations < 1
    puts "life works best spanning many generations"
    return
  end
  puts "Starting Generation"
  print_board(board)
  for i in 1..generations
    puts "Generation #{i}:"
    board = update_board(board, rows, cols)
    print_board(board)
  end
end

def update_board(board, rows, cols)
  #puts "rows: #{rows} cols: #{cols}"
  new_board = create_board(rows, cols, -1)
  pp new_board
  for i in 0..rows-1
    for j in 0..cols-1
      num_of_neighbors = get_number_of_neighbors(board, i, j, rows, cols)
      puts "i: #{i} j: #{j} state: #{board[i][j]} num_neighbors: #{num_of_neighbors}"
      if board[i][j] == 1
        case num_of_neighbors
        when 0..1
          #puts "I got into the 0..1 case for a 1 cell"
          new_board[i][j] = 0 #lonely
        when 4..8
          #puts "I got into the 4..8 case for a 1 cell"
          new_board[i][j] = 0 #overcrowded
        when 2..3
          #puts "I got into the 2..3 case for a 1 cell"
          new_board[i][j] = 1 #lives
        end
      else
        if num_of_neighbors == 3
          #puts "I got into the case = 3 for a 0 cell"
          new_board[i][j] = 1 #Birth
        else
          #puts "I got into the else case for a 0 cell"
          new_board[i][j] = 0 #Barren
        end  
      end
    end
  end
  return new_board
end
#x is row  num, y is col num
# c1 | c2 | c3
# ------------
# c4 | xy | c5
# ------------
# c6 | c7 | c8
# ruby has negitive array indexing so that is why this logic is complicated
def get_number_of_neighbors(board, row_num, col_num, rows, cols)
  c1 = board[row_num-1][col_num-1]
  c2 = board[row_num-1][col_num]
  #puts "failed after 2 x:#{x} y:#{y}"
  c3 = board[row_num-1][col_num+1]
  #puts "failed after 3"
  c4 = board[row_num][col_num-1]
  #puts "failed after 4"
  c5 = board[row_num][col_num+1]
  #puts "failed after 5"
  unless row_num == rows-1
    c6 = board[row_num+1][col_num-1]
    #puts "failed after 6"
    c7 = board[row_num+1][col_num]
    #puts "failed after 7"
    c8 = board[row_num+1][col_num+1]
    #puts "failed after 8"
    #handle edge cases
  end
  if row_num == 0
    c1 = 0
    c2 = 0
    c3 = 0
  end
  if col_num == 0
    c1 = 0
    c4 = 0
    c6 = 0
  end
  if col_num == cols - 1
    c3 = 0
    c5 = 0
    c8 = 0
  end  
  if row_num == rows-1
    c6 = 0
    c7 = 0
    c8 = 0
  end
  #num = c1+c2+c3+c4+c5+c6+c7+c8
  #puts "I got here #{num}"
  #puts "c1: #{c1} c2: #{c2} c3: #{c3} c4: #{c4} c5: #{c5} c6: #{c6} c7: #{c7} c8: #{c8}"
  return c1+c2+c3+c4+c5+c6+c7+c8
end
#run starts here
life(5,5,1,25)
