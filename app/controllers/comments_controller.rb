class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], note_id: comment_params[:note_id], user_id: current_user.id)
    redirect_to "/notes/#{@comment.note.id}"
  end

  private
  def comment_params
    params.permit(:text, :note_id)
  end
end
