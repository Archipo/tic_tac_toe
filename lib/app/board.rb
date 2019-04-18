require_relative 'player'
require_relative 'game'

class Board
    
  attr_accessor :cells

#Permet de mettre à jour le tableau en fonction des inputs du joueur tout en garatissant que la cellule soit vide 

  def initialize
    @cells = [
      "1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"
      ]
  end

#Affichage du corps du tableau (valeurs de base + lignes verticales et horizontales)

  def update_cell(number, symbol)
    if cell_free?(number)
      self.cells[number - 1] = symbol.to_s
      show_board
    else 
      puts "Cellule non vide ! Choisis une autre cellule."
      return false
    end
  end

#Permet de remplacer les cellules par le signe du joueur en checkant si elles
#sont vides, sinon la cellule n'est pas complétée

  def show_board
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

#permet de limiter cette méthode à la classe Board
  private
#Permet de remplacer les cellules par le signe du joueur en checkant si elles sont vides, sinon la cellule n'est pas complétée
  def cell_free?(number)
    cell = self.cells[number - 1]
    if cell == "X" ||  cell == "O"
      false
    else
      true
    end
  end

end