# frozen_string_literal: true

require_relative 'deck'
require_relative 'card'
require_relative 'player'

# ディーラーを表すクラス
class Dealer < Player
  # ディーラーがカードを引く際の処理を行う
  def draw_card(deck)
    hit(deck.draw)
  end

  # ディーラーがカードを引く際の処理を行う
  def play(deck)
    draw_card(deck) while score < 17
  end
end
