=begin
  TODO : 
  - handle walls better : playing with visibility, but also w, l, x, and z related to other walls
=end

#require 'json'

class TiledMap
  def initialize(filename)
    infos = JSON.parse(File.read(filename))
    @width = infos['width']
    @height = infos['height']
    infos['layers'].each do |layer|
      case layer['name']
      when 'floors'
        @tiles = layer["data"].map {|e| e - 1}
      end
    end
    @tile_size = 16
    @tileset = Image.load_tiles('gfx/tileset/tileset.png', @tile_size, @tile_size)
    
  end

  def update
    puts "tiles"
      puts @tiles

  end


  def draw
    @tileset[5].draw(0,0,0)
  end

   
end

class Map
  def initialize(window)
    @tile_size = 16
    @tileset = Image.load_tiles('gfx/tileset/tileset.png', @tile_size, @tile_size)
    @map = TiledMap.new('map/test.json')
  end

  def button_down(id)
    
   
  end

  def button_up(id)
    
  end


  def update
    @map.update
  end

  def draw
   @map.draw
  end
end


