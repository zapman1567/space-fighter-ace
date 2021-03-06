#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2007  Han Dao
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#You can contact the author at wikipediankiba@gmail.com

class GameOver
  def initialize data , score
    @data = data
    @score = score
    @display = Rubygame::Surface.load("data/startscreen.jpeg")
    @display.blit(@data.display.screen,[0,0])
    @q = Rubygame::EventQueue.new()
    text()
    controller()
  end
  def controller
    loop do
      @data.display.screen.flip()
      @q.each do |ev|
        case ev
        when Rubygame::QuitEvent
          Rubygame.quit()
          exit
        when Rubygame::KeyDownEvent
          case ev.key
          when Rubygame::K_ESCAPE
            puts"success"
            return
          end
        end
      end
    end
  end
  def text
    @data.clear()
    @data.declare(:gameover)
    @data.text.add("SCORE TOTAL: #{@score.points}",0,0)
    if @score.check() == true
      @data.text.add("YOU SCORE!",0,0)
      @data.text.add("NAME:",0,0)
    end
  end
end