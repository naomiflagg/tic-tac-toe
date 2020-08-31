# frozen_string_literal: true

class Board
  require 'pry'
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, '| |') }
  end

  def display_board
    @board.each { |row| puts row.join(' ') }
  end

  def add_piece(token, row, column)
    @board[row][column] = "|#{token}|"
  end

  def board_full?
    @board.each do |row|
      return false if row.include?('| |')
    end
  end

  def consecutive_three?
    # Check for three-in-a-row
    array_values_equal_not_blank?(@board) || \
      # Check for three-in-a-column
      array_values_equal_not_blank?(@board.transpose) || \
      # Check for three-in-a-diagonal
      array_values_equal_not_blank?(make_diag_array(@board))
  end

  private

  def array_values_equal_not_blank?(arrays)
    arrays.each do |array|
      return true if (array.uniq.size <= 1) && (array.uniq != ['| |'])
    end
    return false
  end

  def make_diag_array(array)
    [
      [array[0][0], array[1][1], array[2][2]],
      [array[0][2], array[1][1], array[2][0]]
    ]
  end
end
