require './lib/board.rb'
require './lib/player.rb'
require './lib/tic_tac_toe_game.rb'

describe Board do
  let(:board) { Board.new }
  describe '#add_piece' do
    it 'adds X or O to the board' do
      board.add_piece('X', 2, 2)
      expect(board.board[2][2]).to eq('|X|')
    end
  end

  describe '#board_full?' do
    it 'returns false if there are spaces without a token' do
      expect(board.board_full?).to be false
    end

    it 'returns true if there are no spaces without a token' do
      board.board = Array.new(3) { Array.new(3, '|X|')}
      expect(board.board_full?).to be_truthy
    end
  end

  describe '#consecutive_three?' do
    it 'returns true if three-in-a-row' do
      board.board = [['|X|', '|X|', '|X|'], ['| |', '| |', '| |'], ['| |', '| |', '| |']]
      expect(board.consecutive_three?).to be_truthy
    end
    it 'returns true if three-in-a-column' do
      board.board = Array.new(3) { ['|X|', '| |', '| |'] }
      expect(board.consecutive_three?).to be_truthy
    end
    it 'returns true if consecutive three diagonally' do
      board.board = [['|X|', '| |', '| |'], ['| |', '|X|', '| |'], ['| |', '| |', '|X|']]
      expect(board.consecutive_three?).to be_truthy
    end
  end
end

describe Player do
  let(:player) { Player.new('X', 'Player 1') }
  describe '#name' do
    it 'returns the correct name' do
      expect(player.name).to eq('Player 1')
    end
  end

  describe '#token' do
    it 'returns the correct token' do
      expect(player.token).to eq('X')
    end
  end
end
