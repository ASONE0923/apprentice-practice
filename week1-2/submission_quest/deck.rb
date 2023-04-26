# frozen_string_literal: true

require_relative 'card'

# トランプの山札を表すクラス
class Deck
  SUITS = %w[ハート ダイヤ クラブ スペード].freeze
  VALUES = (2..10).to_a.map(&:to_s) + %w[J Q K A]

  # 山札を生成する
  def initialize
    @cards = []
    SUITS.each do |suit|
      VALUES.each do |value|
        card = Card.new(suit, value)
        @cards << card
      end
    end

    # 山札をシャッフルする
    @cards.shuffle!
  end

  # 山札からカードを1枚引く
  def draw
    @cards.pop
  end
end
