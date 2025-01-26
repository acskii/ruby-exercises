require_relative 'board'

# A class for the individual cell on a board
class Cell
  attr_reader :value, :index, :board

  def initialize(board, index)
    return unless board.instance_of? Board

    @board = board
    @index = index.to_i if ((index.instance_of? String) && (index.to_i.to_s == index)) || (index.instance_of? Integer)
    @value = nil
  end

  def value=(value)
    @value = value.to_s
  end

  def to_s
    "<CELL:: Index #{index} Board #{board}>"
  end
end
