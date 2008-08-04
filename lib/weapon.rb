#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2008  Han Dao
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

class Weapon
  attr_accessor :p , :e
  def initialize
    @play = Rubygame::Surface.load("data/game/rocket.png")
    @enem = Rubygame::Surface.load("data/game/badrocket.png")
    @p = []
    @e = []
  end
  def fire x
    if @p.size != 2
      @p << Rect.new(x,550,5,15)
    end
  end
  def pmove
    number = 0
    @p.each do |pos|
      pos.centery -= rand(41) + 5
      if pos.centery <= 0
	@p.delete_at(number)
      end
      number += 1
    end
  end
  def emove
    number = 0
    @e.each do |pos|
      pos.centery += 10
      if pos.centery >= 600
        @e.delete_at(number)
      end
      number += 1
    end
  end
  def incoming x , y
    if @e.size != 5
      @e << Rect.new(x,y,5,15)
    end
  end
  def draw screen
    pmove()
    emove()
    @p.each do |rect|
      @play.blit(screen,[rect.centerx,rect.centery])
    end
    @e.each do |rect|
      @enem.blit(screen,[rect.centerx,rect.centery])
    end
  end
end