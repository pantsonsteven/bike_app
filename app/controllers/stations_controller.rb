class StationsController < ApplicationController

  def show
    @stations = Station.all
  end
  
end
