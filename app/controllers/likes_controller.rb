class LikesController < ApplicationController

  def create
    @note = Note.find(params[:id])
    Like.create(note: @note, user: current_user)
    NoteMailer.new_like(@note, current_user).deliver_now
    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(note: params[:id], user: current_user)
    @like.destroy
    redirect_to root_path
  end

end
