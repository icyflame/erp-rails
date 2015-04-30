class ViewallController < ApplicationController
  def index
  	@allAlums = Alumni.all
  end

  def show
  end
end
