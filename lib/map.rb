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
    @layers = infos['layers']
    @nbr_layers = infos['nextlayerid']-2
    @map = Hash.new
    for i in 0..@nbr_layers
      @map[i] = infos['layers'][i]['data']
    end
    @tile_size = 16
    @tileset = Image.load_tiles('gfx/tileset/tileset.png', @tile_size, @tile_size)
    

  end

  def update
    
  end


  def draw

    i = 0
    for i in 0..@nbr_layers
    tile = 0
    x = 0
    y = 0 

      for y in 0..@height-1
        for x in 0..@width-1
          @tileset[@map[i][tile]-1].draw(x*@tile_size,y*@tile_size,i) if @map[i][tile] != 0
          tile += 1
        end
      end

    end

  end

   
end

class Map
  def initialize(window)
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


