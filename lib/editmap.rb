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

class EditMap
  attr_accessor :mapfiles
  def initialize engine
    @engine = engine
    @charstrack = engine.charstrack
    @itemstrack = engine.itemstrack
    @mapengine = engine.mapengine
    @mapfiles = engine.mapengine.mapfiles
  end
  def setup scrollerui
    @scrollerui = scrollerui
  end
  def save
    @mapfiles.save()
  end
  def edit
    n = retrievelocation()
    if @engine.following.state == false
      modify(n)
    elsif @engine.following.state == true
      delete(n)
    end
  end
  def retrievelocation
    n = 0
    @mapengine.mapobj.each do |map|
      if map.rect.x == @engine.following.rect.x && map.rect.y == @engine.following.rect.y
        return n
      end
      n += 1
    end
  end
  def delete n
    clean()
    zeroall(n)
    datacompute()
  end
  def modify n
    state , choice = @scrollerui.retrievestamp()
    case state
    when 0
      clean()
      zeroall(n)
      @mapfiles.map[n] = choice
      datacompute()
    when 1
      clean()
      zeroall(n)
      @mapfiles.characters[n] = choice
      datacompute()
    when 2
      clean()
      zeroall(n)
      @mapfiles.items[n] = choice
      datacompute()
    end
  end
  def zeroall n
    @mapfiles.map[n] = 0
    @mapfiles.characters[n] = 0
    @mapfiles.items[n] = 0
  end
  def clean
    @itemstrack.clean()
    @charstrack.clean()
    @mapengine.clean()
  end
  def datacompute
    @mapengine.mapdata.datacompute()
    @charstrack.datacompute()
    @itemstrack.datacompute()
    @mapengine.cam()
  end
end
