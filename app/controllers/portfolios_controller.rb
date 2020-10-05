class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.language.downcase!
    if @portfolio.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:url, :text, :title, :language).merge(user_id: current_user.id)
  end
end
