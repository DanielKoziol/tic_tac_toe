# frozen_string_literal: false

require_relative 'tic_tac_toe3_refactor'

describe Game do
  #let(:board) { ["O", nil, "O"]}
  let(:input) {'3'}
  subject(:new_game) { described_class.new }
  
  describe '#count_nils' do

  context 'after game is initialized, whole board is empty' do
  it 'shows board as blank' do
    expect(new_game.count_nils).to eq(10)
  end

  it 'shows board as not containing 8 nils' do
    expect(new_game.count_nils).not_to eq(8)
  end
  end

  describe '#add_move' do

   it 'adds move to board state 0 at 3' do
    move = 7
    new_game.add_move(move)
    expect(new_game.board_state[move]).to eq("O")
   end
  
   it 'doesadds'

  end

  describe '#verify input' do
  
    it 'verifies correct input' do
    allow(new_game).to receive(:gets).and_return(input)
    expect(new_game.get_move).to eq(3)
  
    end

    it 'rejects incorrect input, then accepts correct' do
      invalid_no = '12'
      allow(new_game).to receive(:gets).and_return(invalid_no, input)
      expect(new_game).to receive(:print).twice
      new_game.get_move
      end
  end

  #before do 
  it 'verifies incorrect input twice, then gets correct' do
    allow(new_game).to receive(:getting_move).and_return("ko", '21', input)
    expect(new_game).to receive(:puts).twice
    new_game.get_move
    end

    it 'returns 0 player if 2 places taken' do
      allow(new_game).to receive(:count_nils).and_return(9)
      who = new_game.who_plays?
      expect(who).to eq('X')
    end


    describe '#check winner' do

    it 'finds winner when 1st line is of O' do
      win_line1 = [nil, 'O', 'O', 'O', nil, nil, nil, nil, nil, nil]
      new_game.instance_variable_set(:@board_state, win_line1)

      expect(new_game.check_win).to be(true)
    end

    it 'Not finds winner when 1st line is of O' do
      no_win_line1 = [nil, nil, 'O', 'O', nil, nil, nil, nil, nil, nil]
      new_game.instance_variable_set(:@board_state, no_win_line1)

      expect(new_game.check_win).not_to be(true)
    end
  end

  describe '#announcements' do
    before do
      allow(new_game).to receive(:print_board)
      #allow(new_game).to receive(:count_nils).and_return(1)
      allow(new_game).to receive(:who_plays?)
      allow(new_game).to receive(:add_move)#.and_return(move)
      allow(new_game).to receive(:get_move)
  
    end
    
    it 'announces draw' do
      draw_line1 = [nil, 'X', 'O', 'O', 'X', 'O', 'X', 'O', 'X', 'O']
      new_game.instance_variable_set(:@board_state, draw_line1)

      expect(new_game).to receive(:p).with("Draw!")
      new_game.round_play
    end

    it 'announces winner when 1st line is of O' do
      win_line1 = [nil, 'O', 'O', 'O', nil, nil, nil, nil, nil, nil]
      new_game.instance_variable_set(:@board_state, win_line1)

      expect(new_game).to receive(:p).with("O")
      new_game.round_play
    end

    it 'announces winner when line is of X' do
      win_line1 = [nil, 'X', nil, nil, 'X', nil, nil, 'X', nil, nil]
      new_game.instance_variable_set(:@board_state, win_line1)

      expect(new_game).to receive(:p).with("X")
      new_game.round_play
    end


  end

end
end


