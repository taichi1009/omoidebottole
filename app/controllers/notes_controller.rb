class NotesController < ApplicationController
  before_action :move_to_top, except: :top
  def index
    @notes = Note.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
  end

  def create
    Note.create(image: note_params[:image], text: note_params[:text], user_id: current_user.id)
  end

  def top
  end

  def destroy
    note = Note.find(params[:id])
      if note.user_id == current_user.id
        note.destroy
      end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    note = Note.find(params[:id])
    if note.user_id == current_user.id
      note.update(note_params)
    end
  end

  def show
    @note = Note.find(params[:id])
    @comments = @note.comments.includes(:user)
  end

  private
  def note_params
    params.permit(:image, :text)
  end

  def move_to_top
    redirect_to action: :top unless user_signed_in?
  end
end
