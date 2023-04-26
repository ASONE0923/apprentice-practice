# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

# ブラックジャックを実行するクラス
class Game
  def play_blackjack
    puts 'ブラックジャックを開始します。'
    deck = Deck.new
    player = Player.new
    dealer = Dealer.new

    # プレイヤーとディーラーに2枚ずつカードを配る
    2.times do
      player.hit(deck.draw)
      dealer.hit(deck.draw)
    end

    puts "あなたの引いたカードは#{player.hand[0]}です。"
    puts "あなたの引いたカードは#{player.hand[1]}です。"
    puts "ディーラーの引いたカードは#{dealer.hand[0]}です。"
    puts 'ディーラーの引いた2枚目のカードはわかりません。'

    # プレイヤーのターン
    loop do
      puts "あなたの現在の得点は#{player.score}です。カードを引きますか？（Y/N）"
      response = gets.chomp.upcase

      break unless response == 'Y'

      new_card = deck.draw
      # プレイヤーがカードを引く
      player.hit(new_card)
      puts "あなたの引いたカードは#{new_card}です。"

      break if player.score > 21
    end

    puts "あなたの現在の得点は#{player.score}です。"

    if player.score > 21
      puts 'あなたの負けです！'
    else
      puts "ディーラーの引いた2枚目のカードは#{dealer.hand[1]}でした。"
      dealer.play(deck)
      puts "ディーラーの現在の得点は#{dealer.score}です。"

      if dealer.score > 21 || player.score > dealer.score
        puts 'あなたの勝ちです！'
      elsif dealer.score == player.score
        puts '引き分けです。'
      else
        puts 'あなたの負けです！'
      end
    end

    puts 'ブラックジャックを終了します。'
  end
end

Game.new.play_blackjack
