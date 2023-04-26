# frozen_string_literal: true

# トランプのカードを表すクラス
class Card
  attr_reader :suit, :value

  # カードを生成する
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  # カードの文字列で返す
  def to_s
    "#{suit}の#{value}"
  end

  # カードの得点を返す
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
