# frozen_string_literal: true

class Card
  attr_reader :suit, :value

  def initialize(_suit, value)
    @value = value
  end

  def to_s
    "#{suit}の#{value}"
  end

  def point
    case value
    when 'A'
      11
    when 'J', 'Q', 'K'
      10
    else
      value.to_i
    end
  end
end

class Deck
  SUITS = %w[ハート ダイヤ クラブ スペード].freeze
  VALUES = (2..10).to_a.map(&:to_s) + %w[J Q K A]

  def initialize
    @cards = SUITS.product(VALUES).map { |suit, value| Card.new(suit, value) }
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end
end

class Player
  attr_reader :hand, :score

  def initialize
    @hand = []
    @score = 0
  end

  def hit(card)
    @hand << card
    update_score(card)
  end

  private

  def update_score(card)
    @score += card.point
    adjust_for_ace if @score > 21 && aces_in_hand?
  end

  def aces_in_hand?
    @hand.any? { |card| card.value == 'A' }
  end

  def adjust_for_ace
    @hand.each do |card|
      @score -= 10 if card.value == 'A' && @score > 21
    end
  end
end

def player_turn(deck, player)
  loop do
    puts "あなたの現在の得点は#{player.score}です。カードを引きますか？（Y/N）"
    answer = gets.chomp.upcase
    break unless answer == 'Y'

    player.hit(deck.draw)
    puts "あなたの引いたカードは#{player.hand.last}です。"
  end
end

def dealer_turn(deck, dealer)
  dealer.hit(deck.draw) while dealer.score < 17
end

def determine_winner(player, dealer)
  if player.score > 21
    :dealer
  elsif dealer.score > 21
    :player
  else
    player.score > dealer.score ? :player : :dealer
  end
end

def display_winner(winner)
  if winner == :player
    puts 'あなたの勝ちです！'
  else
    puts 'ディーラーの勝ちです。'
  end
end

def initial_draw(player, dealer, deck)
  2.times { player.hit(deck.draw) }
  2.times { dealer.hit(deck.draw) }
end

def display_initial_cards(player, dealer)
  puts 'ブラックジャックを開始します。'
  puts "あなたの引いたカードは#{player.hand[0]}です。"
  puts "あなたの引いたカードは#{player.hand[1]}です。"
  puts "ディーラーの引いたカードは#{dealer.hand[0]}です。"
  puts 'ディーラーの引いた2枚目のカードはわかりません。'
end

def play_blackjack
  deck = Deck.new
  player = Player.new
  dealer = Player.new

  initial_draw(player, dealer, deck)
  display_initial_cards(player, dealer)

  player_turn(deck, player)
  dealer_turn(deck, dealer)

  winner = determine_winner(player, dealer)
  display_winner(winner)

  puts 'ブラックジャックを終了します。'
end

play_blackjack
