class UsersController < ApplicationController
  def show
    @name = current_user.name
    @notes = current_user.notes.page(params[:page]).per(5).order("created_at DESC")
  end
end
