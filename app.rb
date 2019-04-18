require 'bundler'
Bundler.require

require_relative 'lib/app/game'
require_relative 'lib/app/player'
require_relative 'lib/app/board'

puts "Voulez-vous commencer une partie (écrire 'non' pour quitter l'application <3)"
answer = gets.chomp
while answer != "non" do
    game = Game.new
    game.start_game
    puts "Voulez-vous re-commencer une partie (écrire 'non' pour quitter l'application <3)"
    answer = gets.chomp
end