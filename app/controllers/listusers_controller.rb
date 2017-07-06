class ListusersController < ApplicationController

  def index
    @users = User.all
  end

end
