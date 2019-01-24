require 'player'

class View

  attr_accessor :bof

  def initialize
    @bof = [ [" "," "," "] , [" "," "," "] , [" "," "," "] ]
  end

  def primary_board
    launch_board(@bof)
  end

 def launch_board(arr)
  
   puts ""
              puts "                                      |#{arr[0][0]}|#{arr[0][1]}|#{arr[0][2]}|"
              puts "                                      |#{arr[1][0]}|#{arr[1][1]}|#{arr[1][2]}|"
              puts "                                      |#{arr[2][0]}|#{arr[2][1]}|#{arr[2][2]}|"
   puts " "
 end

 def play(player ,position)
    position = position.upcase
    if player == "joueur1"
      z = "X"
    elsif player == "joueur2"
      z = "O"
    end

    if position[0] == "A"
        i = 0
    elsif position[0] == "B"
        i = 1
    elsif position[0] == "C"
        i = 2
    end
     @bof[i][position[1].to_i] = z
    return launch_board(@bof)
 end

def iswin?(token)
  if (@bof[0][0] == @bof[0][1] && @bof[0][1] == @bof[0][2] && @bof[0][0] == token) || (@bof[1][0] == @bof[1][1] && @bof[1][1] == @bof[1][2] && @bof[1][0] == token) || (@bof[2][0] == @bof[2][1] && @bof[2][1] == @bof[2][2] && @bof[2][0] == token) || (@bof[0][0] == @bof[1][0] && @bof[1][0] == @bof[2][0] && @bof[0][0] == token) || (@bof[0][1] == @bof[1][1] && @bof[1][1] == @bof[2][1] && @bof[0][1] == token) || (@bof[0][2] == @bof[1][2] && @bof[1][2] == @bof[2][2] && @bof[0][2] == token) || (@bof[0][0] == @bof[1][1] && @bof[1][1] == @bof[2][2] && @bof[0][0] == token) || (@bof[0][2] == @bof[1][1] && @bof[1][1] == @bof[2][0] && @bof[0][2] == token)
    return true
  else
    return false
  end
end

end
