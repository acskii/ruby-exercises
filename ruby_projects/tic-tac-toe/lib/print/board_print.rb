module BoardPrint
  def self.print_horizontal_border
    puts " #{'-' * 11} "
  end

  def self.print_row(cells)
    print '|'
    cells.each_key do |key|
      val = cells[key].value
      print " #{val.to_s.empty? ? ' ' : val} |"
    end
    puts ''
  end
end
