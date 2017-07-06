class LikesController < ApplicationController

  def create
    @note = Note.find(params[:id])

    if note.user != current_user
      Like.create(note: @note, user: current_user)
      NoteMailer.new_like(@note, current_user).deliver_now
    end

    redirect_to root_path
  end

  def destroy
    @like = Like.find_by(note: params[:id], user: current_user)
    @like.destroy
    redirect_to root_path
  end

end
