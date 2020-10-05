class PortfoliosController < ApplicationController
  before_action :set_portrolio, only: [:edit, :show]
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
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    portfolio = Portfolio.find(params[:id])
    if portfolio.update(portfolio_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    portfolio = Portfolio.find(params[:id])
    if portfolio.destroy
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def set_portrolio
    @portfolio = Portfolio.find(params[:id])
  end

  def portfolio_params
    params.require(:portfolio).permit(:url, :text, :title, :language).merge(user_id: current_user.id)
  end
end
