class ProfilesController < ApplicationController

  before_action :authorize, only: [:index, :edit]

  def index
  end

 

end