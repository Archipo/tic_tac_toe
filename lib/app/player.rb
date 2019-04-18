require_relative 'board'
require_relative 'game'


class Player
  
  attr_accessor :name, :symbol

#initialise la classe Player avec les valeurs de bases
  def initialize(name, symbol, board)
    @name = name 
    @symbol = symbol
    @board = board 
  end

#permet mettre à jour les cells en fonction de la valeur déterminée par le joueur
  def move(cell)
    @board.update_cell(cell, self.symbol)
  end

  def winner?
    wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 6]]
    wins.each do |win|
      values = [cells[win[0]], cells[win[1]], cells[win[2]]]
      return true if values.include?(self.symbol.to_s) &&
      ((values[0] == values[1]) && (values[1] == values[2]))
    end
    false
  end

  private

#permet de lier les cellules à la classe joueur
  def cells 
    @board.cells
  end

end
