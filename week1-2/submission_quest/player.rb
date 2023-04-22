# frozen_string_literal: true

require_relative 'card'

# ゲームのプレイヤーを表すクラス
class Player
  attr_reader :hand, :score

  def initialize
    @hand = []
    @score = 0
  end

  # プレイヤーがカードを引く際の処理を行う
  def hit(card)
    @hand << card
    update_score(card)
  end

  private

  # 手札の点数を更新する役割を担う
  def update_score(card)
    @score += card.point

    # 手札にエースがある場合、点数が21点を超えていたらエースを1点として扱う
    adjust_for_ace if @score > 21 && aces_in_hand?
  end

  # 手札にエースがあるかどうかを判定する
  def aces_in_hand?
    @hand.select { |card| card.value == 'A' }.any?
  end

  # 手札にエースがある場合、点数が21点を超えていたらエースを1点として扱う
  def adjust_for_ace
    @hand.each do |card|
      @score -= 10 if card.value == 'A' && @score > 21
    end
  end
end
