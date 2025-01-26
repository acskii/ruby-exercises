require 'colorize'

# A Player class that contains their symbol and name
class Player
  attr_accessor :name

  def initialize(name, sym)
    @name = name
    if sym.length == 1
      @sym = sym
    else
      puts "INVALID PLAYER SYMBOL #{sym}".colorize(:red)
    end
  end

  def symbol
    @sym
  end

  def to_s
    "<PLAYER:: Symbol #{symbol} Name #{name}>"
  end
end
