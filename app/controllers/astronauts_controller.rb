class AstronautsController < ApplicationController
  def index
    @astronauts = Astronaut.all
    @missions = Mission.alpha_sort
  end
end
