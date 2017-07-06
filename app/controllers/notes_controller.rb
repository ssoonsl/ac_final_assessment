class NotesController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @notes = Note.all
    @users = User.all

    if user_signed_in?
      followees_id = current_user.followers.pluck(:followee_id)

      unless followees_id.nil?
        @followees = User.find(followees_id)
        followees_id.push(current_user.id)
        @notes = Note.where(user: followees_id)
      end
    end
  end

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

end
