class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:id])  # 1回目の修正：コメント投稿機能
    @comment = Comment.new(comment_params)
    @comments = @prototype.comments.includes(:user)   # 1回目の修正：コメント投稿機能

    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      render "prototypes/show" ,status: :unprocessable_entity   # 1回目の修正：コメント投稿機能
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id] )
  end
end
