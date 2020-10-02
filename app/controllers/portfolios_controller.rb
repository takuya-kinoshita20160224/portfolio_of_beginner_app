class PortfoliosController < ApplicationController
  def index
  end

  def new
    @portfolio = Portfolio.new
  end
end
