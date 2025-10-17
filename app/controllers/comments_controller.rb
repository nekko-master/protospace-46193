class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])  # 2回目の修正：コメント投稿機能
    @comment = @prototype.comments.new(comment_params)  # 2回目の修正：コメント投稿機能
    @comments = @prototype.comments.includes(:user)   # 1回目の修正：コメント投稿機能

    if @comment.save
      redirect_to prototype_path(@prototype)  #2回目の修正：コメント投稿機能
    else
      render "prototypes/show" ,status: :unprocessable_entity   # 1回目の修正：コメント投稿機能
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id )  # 2回目の修正：コメント投稿機能
  end
end
