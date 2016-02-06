require 'game'

describe Game do
  subject(:game) {described_class.new(player_1, player_2)}
  let(:player_1) {double :player_1}
  let(:player_2) {double :player_2}

  describe '#initialize' do
    it 'includes player1' do
      expect(game.player_1).to eq player_1
    end
    it 'includes player2' do
      expect(game.player_2).to eq player_2
    end
    it 'starts as player_2 go' do
      expect(game.turn).to eq player_2
    end
  end

  describe '#attack' do
    it 'attacks the other player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#switch_turn' do
    it 'changes turn from player1 to player2' do
      game.switch_turn
      expect(game.turn).to eq player_1
    end
  end

end
