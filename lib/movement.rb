#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2008 Han Dao
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

class Movement
  attr_reader :speed
  def initialize fighter
    @fighter = fighter
    @direction = 0
    @speed = 0
    @rotate = 0
    @rotatespeed = 0
    @angle = - Math::PI / 2
    @mode = false
    @speedup = Timer.new(1) {
      @speed += 2
    }
    @speedup.start()
  end
  def update
    @fighter.angle = @angle
    movex = @speed * Math.cos(@fighter.angle)
    movey = @speed * Math.sin(@fighter.angle)
    @fighter.rect.centerx += movex
    @fighter.rect.centery += movey
  end
  def directionmove
    case @direction
    when 1
      @angle = - Math::PI / 2
    when 2
      @angle = Math::PI / 2
    when 3
      @angle = 0
    when 4
      @angle = Math::PI
    end
    update()
  end
  def change_brust
    if @mode == false
      @mode = true
    else
      @mode = false
    end
  end
  def increase
    @speedup.check()
  end
  def directionchange n
    if n == @direction
      return
    end
    @direction = n
    reset()
  end
  def reset
    @speed = 3
  end
end
