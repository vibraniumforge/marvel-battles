class BattlesController < ApplicationController

  def show
    finder
  end

  def index
    @battles=Battle.all
  end

  def new
    @battle=Battle.new
  end

  def create
    battle=Battle.create(post_params)
  end

  def edit
    finder
  end

  def update
    finder
  end

  def destroy
    finder
    @battle.destroy
    redirect_to '/'
  end

  private

    def post_params
      params.require(:battle).permit(:location)
    end

    def finder
      @battle=Battle.find(params[:id])
    end
end
