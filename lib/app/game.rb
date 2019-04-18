require_relative 'board'
require_relative 'player'

class Game

  def initialize
    @board = Board.new
    @current_player = ""
    @winner = false
    @turn = 0
  end
  
  #Méthode permettant de lancer le jeu et de démarrer la partie et déterminer l'issue de la partie. On crée de nouveaux joueurs avec des noms récupérés de la méthode 'get_names'.
  def start_game
    names = get_names
    @player1 = Player.new(names[0], :X, @board)
    @player2 = Player.new(names[1], :O, @board)
    @current_player = @player1
    @board.show_board
    turn until @winner || @turn == 9
    if @winner
      puts "#{@winner.name} a gagné!"
    else
      puts "Match nul, un peu comme votre niveau apparemment ! "
    end
  end
  
  private
   #le joueur peut entrer un nombre compris entre 1 et 9, si le nombre n'est pas compris dans cet intervalle un message s'affiche demandant de redonner une valeur.
  def turn
    puts "A #{@current_player.name} de jouer. Choisis ta case (1-9): "
    choice = gets.chomp.to_i
    if choice > 9 || choice < 1
      puts "ATTENTION : le nombre doit être compris entre 1 et 9"
    elsif @current_player.move(choice) != false
      @winner = @current_player if @current_player.winner?
      @turn += 1
      switch_player
    end
  end
  
  # Méthode permettant de mettre en place les changement de joueur
  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end
  
  #Méthode permettant d'obtenir le nom des joueurs, on utilise le gest.chomp
  def get_names
    puts "Nom du joueur X : "
    name1 = gets.chomp
    puts "Nom du joueur O : "
    name2 = gets.chomp
    [name1, name2]
  end

end
  