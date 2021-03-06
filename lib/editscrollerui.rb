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

class EditScrollerUi
  attr_accessor :scrollerdata
  def initialize ui
    @ui = ui
    @data = @ui.data
    @scrollerdata = EditScrollerData.new(@ui.engine)
    @scrollerdata.extract()
  end
  def text
    @data.declare(:Options)
    @data.text.add("Current stamping",800,50)
    @data.text.add("choice:",800,75)
    @scrollerdata.object.draw(@data.display.screen)
  end
  def retrievestamp
    return @scrollerdata.state , @scrollerdata.n
  end
end
