#Mapeditor program
#Copyright (C) 2008 Han Dao and contributors
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

#You can contact the author at wikipediankiba@gmail.com

class EditMode
  attr_accessor
  def initialize data , loggerui
    @data = data
    @loggerui = loggerui
    @q = Rubygame::EventQueue.new()
    @background = Rubygame::Surface.load("data/mapeditor.jpeg")
    @engine = EditEngine.new()
    @cursor = EditCursor.new(@loggerui)
    @engine.setfollow(@cursor)
    @engine.setchar(CharType.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setmapsurface([800,600])
    @engine.setscreenlimit(Rect.new([0,0,800,600]))
    @engine.setimages("data/images.yml") 
    @mode = true
  end
  def setfiles name
    @engine.setmapfile(name)
  end
  def draw
    @engine.compute()
    @background.blit(@data.display.screen,[0,0])
    @engine.draw(@data.display.screen)
    @cursor.draw(@data.display.screen)
  end
  def run
    @engine.setup(@loggerui,@data)
    loop do
      @q.each do |ev|
        case ev
        when Rubygame::QuitEvent
          Rubygame.quit()
          exit
        when Rubygame::KeyDownEvent
          case ev.key
          when Rubygame::K_ESCAPE
            Rubygame.quit()
            exit
          when Rubygame::K_TAB
            @data.type.switch()
            if @mode == true
              @mode = false
            else
              @mode = true
              @data.type.clean()
            end
            @engine.editui.typeui.inputmatch()
          end
          keyboard(ev)
        end
        if @mode == false
          @background.blit(@data.display.screen,[0,0])
          @data.type.active(ev)
          @data.type.render()
          @data.display.screen.update(0,750,800,18)
        end
      end
      if @mode == true
        draw()
        @data.display.screen.flip()
      end
    end
   end
   def keyboard ev
    if @mode == true
      case ev.key
      when Rubygame::K_UP
        @cursor.rect.y -= 60
      when Rubygame::K_DOWN
        @cursor.rect.y += 60
      when Rubygame::K_RIGHT
        @cursor.rect.x += 80
      when Rubygame::K_LEFT
        @cursor.rect.x -= 80
      when Rubygame::K_RETURN
        @engine.cycle()
      when Rubygame::K_J
        @cursor.change()
      when Rubygame::K_SPACE
        @engine.edit()
      end
    end
   end
end
