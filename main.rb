require 'dxruby'
require_relative 'map'


Window.width = 800
Window.height = 600

map = Map.new("map_data/map.dat")


Window.loop do
  
  map.update
  map.draw

end
