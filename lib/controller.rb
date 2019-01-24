require 'view'
require 'player'

class Controller
  attr_accessor :cases , :view, :joueur1 , :joueur2

  def initialize
  @view = View.new
  @cases =[]
  end

  def ask_name
    puts "Quel est le nom du joueur 1 ?"
    name_joueur1 = gets.chomp
    tok0 = "X"
    joueur1 =Player.new(name_joueur1,tok0)
    @joueur1 = joueur1
    puts "OK , #{joueur1.name} jouera avec les #{joueur1.token} "
    puts "Quel est le nom du joueur 2 ?"
    name_joueur2 = gets.chomp
    tok1 = "O"
    joueur2 = Player.new(name_joueur2,tok1)
    @joueur2 = joueur2
    puts "OK , #{joueur2.name} jouera avec les #{joueur2.token} "
  end

  def create_game
    @view.primary_board
  end

#VERIFICATION SI LE TABLEAU EST REMPLI
  def isfull?
    if @cases.length == 9
      return true
    else
      return false
    end
  end

#VERIFICATION DES VALEURS DÉJA JOUÉES
  def not_played?(value)
    if @cases.include?(value)
      puts "NOOOOOOOOOOO , reessaye avec une autre"
      return false
    else
      return true
    end
  end

  def case_authorization?(value)
    possibilities =["A0","A1","A2","B0","B1","B2","C0","C1","C2"]
    if possibilities.include?(value)
      return true
    else
      puts "va bouler "
      return false
    end
  end

  def empty_game
    @view.bof =  [ [" "," "," "] , [" "," "," "] , [" "," "," "] ]
    @cases =[]
    @view.primary_board
  end

# ALGORYTHME DE JEU JOUEUR PAR JOUEUR
  def play
    state = 0
    empty_game
    while true
      if state == 0
          puts "C'est à #{@joueur1.name} de jouer (jeton #{@joueur1.token})"
          puts "Case de A1-C3 #{@joueur1.name} ?"
          n = gets.chomp.upcase

          until not_played?(n) && case_authorization?(n)
            n = gets.chomp.upcase
          end
          @cases << n
          @view.play("joueur1",n)

         if @view.iswin?(@joueur1.token)
           puts "#{@joueur1.name} a gagné."
           puts "Yes Vous avez gagné #{@joueur1.name}!"
           puts" "
           @joueur1.score += 1
           break
         elsif isfull?
           puts "Match nul !"
           break
         else
           state = 1 - state
         end
      else
          puts "C'est à #{@joueur2.name} de jouer (jeton #{@joueur2.token})"
          puts "case de A1 - C3#{@joueur2.name} ?"
          n = gets.chomp.upcase

          until not_played?(n) && case_authorization?(n)
            n = gets.chomp.upcase
          end

          @cases << n
          @view.play("joueur2",n)

          if @view.iswin?(@joueur2.token)
            puts "#{@joueur2.name} a gagné."
            puts "Yes Vous avez gagné  #{@joueur2.name}!"
            puts" "
            @joueur2.score += 1
            break
          elsif isfull?
            puts "Match nul !"
            break
          else
           state = 1 - state
          end
       end
     end
   end


end
