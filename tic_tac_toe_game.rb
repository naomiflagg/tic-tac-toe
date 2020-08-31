# frozen_string_literal: true

class TicTacToeGame
  require_relative('player.rb')
  require_relative('board.rb')
  require 'pry'

  attr_accessor :current_player, :game_board

  def initialize
    @player1 = Player.new('X', 'Player 1')
    @player2 = Player.new('O', 'Player 2')
    @current_player = @player1
    begin_game
  end

  private

  def begin_game
    puts 'Welcome to Tic-Tac-Toe! Player 1, your token '\
    "is X. Player 2, your token is O. Let's begin with Player 1!"
    @game_board = Board.new
    play_turn
  end

  def play_turn
    loop do
      @game_board.display_board
      get_move
      @game_board.add_piece(@current_player.token, @row, @column)
      break if game_over?

      switch_player
    end
  end

  def get_move
    # Ask user for input until selection is valid
    loop do
      puts 'First, give me the row for your token. 1, 2 or 3?'
      # Get player input, and subtract 1 to align with board array indices
      @row = @current_player.get_coord - 1
      puts 'Okay, now the column. 1, 2 or 3?'
      @column = @current_player.get_coord - 1
      break if valid?(@row, @column)
    end
  end

  def valid?(row, column)
    # Ensure that selection is numerical and on the board
    unless [row, column].all? { |index| (0..2).include?(index) }
      puts 'One or more of your selections was not 1, 2, or 3. Try again.'
      return false
    end

    # Ensure that selected square has not been taken
    unless @game_board.board[row][column] == '| |'
      puts 'That square has already been taken. Try again.'
      return false
    end

    return true
  end

  def game_over?
    # Check for three consecutive matching tokens
    if @game_board.consecutive_three?
      p "Game over. #{@current_player.name} wins!"
    # Check if board is full
    elsif @game_board.board_full?
      p "Game over. It's a tie!"
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
    puts "Thanks. #{@current_player.name}, you're up!"
  end
end

TicTacToeGame.new
