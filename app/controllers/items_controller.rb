  class ItemsController < ApplicationController
  def index
    @user = current_user
    run Item::Operation::Index do |item|
      @items = item[:items]
    end
  end

  def new
    @user = current_user
    run Item::Operation::Create::Present
    byebug
    @test = 'wew'
  end

  def create
    byebug
    @test = "wew"
    @user = current_user
    run Item::Operation::Create do |_|
      return redirect_to items_path , flash: {success: "Post Successfully Created"}
    end

    render :new, status: :unprocessable_entity
  end
end
