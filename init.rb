require "rubygems"
require 'json'
require 'gosu'

include Gosu

require_relative 'lib/map.rb'

class Game < Window
  def initialize
    super(640, 480, false)
    @font = Gosu::Font.new(24)
    @main_state = Map.new(self)
  end

  def needs_cursor?; true; end

  def button_down(id)
    super
    @main_state.button_down(id)
    close! if id == Gosu::KB_ESCAPE
  end

  def button_up(id)
    @main_state.button_up(id)
  end


  def update
    @main_state.update
  end

  def draw
    @main_state.draw
  end
end

Game.new.show
