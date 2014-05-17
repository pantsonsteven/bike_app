class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    # THIS IS A TEMPORARY WAY OF OBTAINING A USER
  # THIS WILL NOT ALLOW FOR MORE THAN 1 USER
  # THIS IS A PROBLEMTO BE RESOLVED ON MONDAY
  def current_user
    @current_user = User.first
  end

end
