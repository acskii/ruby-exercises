require_relative 'board'
require_relative 'player'
require 'colorize'
require 'io/console'

# Main game class
class TicTacToe
  attr_reader :plr1, :plr2, :playing

  def initialize
    @plr1 = Player.new('Player 1', 'X')
    @plr2 = Player.new('Player 2', 'O')
    @board = Board.new(@plr1, @plr2)
    @playing = @plr1
    @err = 0
  end

  def start_game
    while true
      print_board
      current_playing
      puts "WINNER #{game_over?}"

      print 'Place in cell: '
      ans = valid_input? gets.chomp.to_i

      unless ans
        @err = 1
        next
      end
      @err = 0

      @board.record_player_move(playing, ans - 1)

      break if game_over?

      switch_player
    end

    winner = @board.winner
    puts "WINNER: #{winner ? winner.name : 'NONE'}".colorize(:green)
  end

  private

  def valid_input?(input)
    input.between?(1, 9) ? input : nil
  end

  def print_board
    $stdout.clear_screen
    @board.p_print
    puts 'INVALID INPUT'.colorize(:red) unless @err.zero?
  end

  def game_over?
    @board.board_full? || @board.winner
  end

  def current_playing
    puts "[#{playing.name}] PLAYING AS: #{playing.symbol}".colorize(:magenta)
  end

  def switch_player
    @playing = playing == plr1 ? plr2 : plr1
  end
end
