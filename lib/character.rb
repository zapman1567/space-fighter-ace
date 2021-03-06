#The CopyPirate
#Copyright (C) 2008 Han Dao and contributors
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# You can contact the author at wikipediankiba@gmail.com


class Character
  include Rubygame::Sprites::Sprite
  attr_accessor :action , :retainer , :health , :state , :rect , :name , :engine , :image , :death
  def initialize image , engine
    super()
    @image = Rubygame::Surface.load(image)
    @rect = Rubygame::Rect.new(0,0, *@image.size)
    @health = 30
    @death = false
    @name = "unspecified"
    @engine = engine
  end
  # NOTE: Set the location of the Character on the map.
  def sets x , y
    @rect.x = x
    @rect.y = y
  end
  def kill
    @death = true
  end
end
