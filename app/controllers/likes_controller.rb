class LikesController < ApplicationController

  before_action :authenticate_user!

  def create
    @note = Note.find(params[:id])

    if @note.user != current_user
      Like.create(note: @note, user: current_user)
      NoteMailer.new_like(@note, current_user).deliver_later
    end

    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(note: params[:id], user: current_user)
    @like.destroy
    redirect_to root_path
  end

end
