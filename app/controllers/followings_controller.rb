class FollowingsController < ApplicationController

  before_action :authenticate_user!

  def create
    @followee = User.find(params[:id])
    @follower = current_user

    if @followee != @follower
      Following.create(followee: @followee, follower: @follower)
      flash.notice = "Now following user #{@followee.email}"
    end

    redirect_to listusers_path
  end

  def destroy
    @followee = User.find(params[:id])
    @follower = current_user
    @following = Following.find_by(followee: @followee, follower: @follower)

    @following.destroy
    redirect_to notes_path
  end

end
