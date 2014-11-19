#!/usr/bin/env ruby -w
require 'gosu'
require './lib/player.rb'

class GameWindow < Gosu::Window
  def initialize
    super(640, 480, false)
    @background_image = Gosu::Image.new(self, "assets/background.png", true)
    @player = Player.new(self) # Self refers to the window
  end

  def draw
    @background_image.draw(0,0,0)
    @player.draw
  end

  def update
    @player.move
    control_player
  end

  def control_player
    if button_down? Gosu::KbLeft
      @player.turn_left
    end
    if button_down? Gosu::KbRight
      @player.turn_right
    end
    if button_down? Gosu::KbUp
      @player.accelerate
    end
  end

  def button_down(id)
    close if id == Gosu::KbQ # Creates'quit' function
  end

end

window = GameWindow.new
window.show