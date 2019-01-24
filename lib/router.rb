require 'controller'

class Router
  attr_reader :controller
  def initialize
    @controller =  Controller.new
  end 
  def perform 
    puts "*______* THP MORPION DE MOMO POLO ET YANNICK *________*"
    while true

      puts "Que veux tu faire ?"
      puts "1. t'as envie de jouer tappe 1"
      puts "2. A la prochaine patron"

      params = gets.chomp.to_i 

      case params 
      when 1
        puts "On y va"
        @controller.ask_name
        @controller.create_game
        @controller.play
      when 2
        puts "À bientôt !"
        break 
      else
        puts "va bouler" 
      end
    end
  end
end
