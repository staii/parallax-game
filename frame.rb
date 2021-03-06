# Interface to drawing surface

require 'sdl'
SDL.init(SDL::INIT_VIDEO)

class Frame

  def initialize(width, height)
    @width, @height = width, height
    @screen = SDL::Screen.open(@width, @height, 0, SDL::SWSURFACE)
    @white = @screen.format.map_rgb(255,255,255)
    @black = @screen.format.map_rgb(0, 0, 0)
  end

  def pixel(x ,y)
    @screen.put_pixel((@width / 2.0) * (1 + x), (@height / 2.0) * (1 + y), @white)
  end

  def line(x0, y0, x1, y1)
    @screen.draw_line((@width / 2.0) * (1 + x0), (@height / 2.0) * (1 + y0), (@width / 2.0) * (1 + x1), (@height / 2.0) * (1 + y1), @white)
  end

  def clear
    @screen.fill_rect(0, 0, @width, @height, @black)
  end

  def draw
    @screen.flip
  end

end
