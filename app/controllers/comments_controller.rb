class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to "/portfolios/#{comment.portfolio.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, portfolio_id: params[:portfolio_id])
  end
end
