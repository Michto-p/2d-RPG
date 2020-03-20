=begin
  
=end

class TiledMap

  attr_accessor :map

  def initialize(filename)
    load_map(filename)
    @tileset = Image.load_tiles('gfx/tileset/tileset.png', @tilewidth, @tileheight)
  end

  def load_map(filename)

    infos = JSON.parse(File.read(filename))

    @width = infos['width']
    @height = infos['height']
    @tilewidth = infos['tilewidth']
    @tileheight = infos['tileheight']
    
    @layers = infos['layers']
    @nbr_layers = infos['nextlayerid']-2
  
    @map = Hash.new

    for i in 0..@nbr_layers
        @map[i] = infos['layers'][i]['data'],infos['layers'][i]['visible']
    end
   
  end



  def draw(pos_x=0,pos_y=0,z=0)
    i = 0
    for i in 0..@nbr_layers
    tile = 0
    x = 0
    y = 0 
      if @map[i][1]
        for y in 0..@height-1
          for x in 0..@width-1
            @tileset[@map[i][0][tile]-1].draw(pos_x+x*@tilewidth,pos_y+y*@tileheight,z+i*10) if @map[i][0][tile] != 0
            tile += 1
          end
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
    
  end

  def draw
    @map.draw
  end
end


