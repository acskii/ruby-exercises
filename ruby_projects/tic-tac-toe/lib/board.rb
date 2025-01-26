require_relative 'cell'
require_relative 'player'
require_relative 'print/board_print'

module BoardCheck
  def self.horizontal_check(cells)
    check = nil
    3.times do |i|
      check = cells[i].value if cells[i].value == cells[i + 1].value && cells[i + 1].value == cells[i + 2].value
    end
    check
  end

  def self.vertical_check(cells)
    check = nil
    3.times do |i|
      check = cells[i].value if cells[i].value == cells[i + 3].value && cells[i + 3].value == cells[i + 6].value
    end
    check
  end

  def self.diagonal_check(cells)
    mid = cells[4].value
    mid if (cells[0].value == mid && mid == cells[8].value) || (cells[2].value == mid && mid == cells[6].value)
  end
end

# A TicTacToe board class that represents a 3x3 grid
class Board
  attr_reader :plr1, :plr2

  def initialize(player1, player2)
    unless [player1, player2].all? { |player| player.instance_of? Player }
      puts 'INVALID PLAYER OBJECTS GIVEN WHEN MAKING BOARD'
      return
    end

    @plr1 = player1
    @plr2 = player2
    @moves1 = []
    @moves2 = []
    @cells = {}

    # Setting up initial board
    9.times do |index|
      @cells[index] = Cell.new(self, index)
    end
  end

  def record_player_move(plr, cell_index)
    return false unless plr.instance_of? Player

    edit_cell(cell_index, plr.symbol)
  end

  def cell_index?(cell_index)
    cell_index.to_i.between?(0, 8) && (cell_index.to_i.to_s == cell_index.to_s)
  end

  def board_full?
    @cells.all? do |_, cell|
      !cell.value.to_s.empty?
    end
  end

  def winner
    sym = BoardCheck.horizontal_check(@cells) || BoardCheck.vertical_check(@cells) || BoardCheck.diagonal_check(@cells)

    return nil unless sym

    sym == plr1.symbol ? plr1 : plr2
  end

  def p_print
    BoardPrint.print_horizontal_border
    BoardPrint.print_row(@cells.select { |key| key.between?(0, 2) })
    BoardPrint.print_horizontal_border
    BoardPrint.print_row(@cells.select { |key| key.between?(3, 5) })
    BoardPrint.print_horizontal_border
    BoardPrint.print_row(@cells.select { |key| key.between?(6, 8) })
    BoardPrint.print_horizontal_border
  end

  def to_s
    "<Board:: Sym1 #{sym1} Sym2 #{sym2}>"
  end

  private

  def edit_cell(cell_index, sym)
    return false unless cell_index?(cell_index)

    if @cells[cell_index].value.to_s.empty?
      sym == plr1.symbol ? @moves1 << cell_index : @moves2 << cell_index

      @cells[cell_index].value = sym
    end
    true
  end
end
