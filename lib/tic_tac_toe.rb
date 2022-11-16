require "pry"
class TicTacToe
    attr_accessor :board

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]

    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input_string)
        arr_value = Integer(input_string) - 1
        rescue ArgumentError
    end

    def move(board_index, x_or_o)
        if ["X", "O"].include?(x_or_o) then
            @board[board_index] = x_or_o
        end
    end

    def position_taken?(position)
        @board[position] != " " 
    end    

    def valid_move?(position)
        position.between?(0,8) && !position_taken?(position)
    rescue NoMethodError
    end

    def turn_count
        @board.count("X") + @board.count("O")
    end

    def current_player
        turn_count%2 == 0 ? "X" : "O"
    end 

    def turn
        # streamline
        input = gets
        mod_input = input_to_index(input)
        if valid_move?(mod_input) then
            move(mod_input, current_player)
            display_board
        else
            turn
        end 
    end

    def won?
        winning_combo = WIN_COMBINATIONS.find do |combo|
            [["X", "X", "X"], ["O", "O", "O"]].include?([@board[combo[0]], @board[combo[1]], @board[combo[2]]])
        end
    end

    def full?
        turn_count == 9
    end

    def draw?
        !won? && full?
    end

    def over?
        draw? || won?
    end

    def winner
        # streamline
        if won? != nil then
            current_player == "X" ? "O" : "X"
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end