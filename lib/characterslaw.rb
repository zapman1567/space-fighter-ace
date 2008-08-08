#YourGameHere
#Copyright (C) 2008 YourNameHere

#Kiba Role Playing Game Engine(KRPGE)
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

class CharactersLaw < ItemsLaw
  def initialize engine
    super(engine)
    @avoid = []
  end
   # NOTE: Check if a character collide with any of the other character.
  # char represent an object in the character array.
  # When char does equal the object being compared, it mean that the char and the object being compared are one and the same.
  # So it doesn't check for collision for that one.
  def characterscollide target
    char = 0
    @c.each do |c|
	    if eligible?(target,c)
        if c.rect.collide_rect?(target)
          return 1
        end
	      char += 1
      end
    end
  end
  def eligible? target , c 
    if target == c
      return false
    end
    @avoid.each do |avoid|
      if avoid.class == target.class
        return false
      end
    end
    return true
  end
  def compute
    @c.each do |c|
	    t = maprevert(c)
	    c = t
	    t = charactersrevert(c)
    end
  end
  def charactersrevert t
    c = characterscollide(t)
    if c == 1
	    change(t)
    end
    return t
  end
  def change t
    if t.retainer != nil
      t.rect.x = t.retainer[0]
      t.rect.y = t.retainer[1]
      return t
    end
  end
  # NOTE: Add a list of class to avoid.
  def add_to_avoid_list class_name
    @avoid << class_name
  end
end
