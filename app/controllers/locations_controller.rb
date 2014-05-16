class LocationsController < ApplicationController


 def new
  @location = Location.new
  end

  def create

    redirect_to location_path
  end

  def show
  end




end
