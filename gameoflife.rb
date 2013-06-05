#! /usr/bin/ruby

board = [
	[false, true, false, false, true],
	[true, true, false, false, true],
	[false, false, true, false, false],
	[true, false, false, false, false],
	[false, true, false, true, true]
]

@live = [2,3]

def print_board (board)
board.each{|row| 
	row.each { |cell|
		print "#{cell} "
	}
	puts
}
end

puts "INITIAL BOARD"

print_board(board)


def sum_neighbors (board, row_index, col_index)
	sum = 0
	for i in -1..1
		for j in -1..1
			next if (i == 0 && j == 0) || out_of_bounds(board,row_index+i,col_index+j)
			sum += (board[row_index + i][col_index + j] ? 1 : 0 )
		end
	end
	sum
end

def out_of_bounds(board,row,col)
	max_row = board.length - 1

	max_col = board[0].length - 1

	#puts "Row: #{row} Col: #{col} max_row: #{max_row} max_col: #{max_col}"

	row < 0 || col < 0 || row > max_row || col > max_col
end


def tick (board)
	board.each_with_index.map {|row, row_index|
		row.each_with_index.map {|cell, col_index|
			sum = sum_neighbors(board,row_index,col_index)
			(@live.include?(sum) && cell) || (!cell && sum == 3)
		}
	} 
end

def line
	puts "--------------------"
end

line

i = 1
num_iterations = 3
num_iterations.times do
	board = tick(board)
	puts "ITERATION #{i}"
	print_board(board)
	line
	i+=1
end