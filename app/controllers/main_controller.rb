class MainController < ApplicationController
  def index
    @category = Category.get(params[:id])
    @title = @category.title
  end
end
