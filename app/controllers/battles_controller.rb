class BattlesController < ApplicationController

  def index
    @battles=Battle.all
    binding.pry
  end

  def show
    @battle=Battle.find(params[:id])
  end

  def new
    @battle=Battle.new
  end

  def create
    @battle=Battle.create(battle_params)
    if @battle.save
      binding.pry
      # redirect_to battles_path
      render :index
    else
      binding.pry
      render :new
    end
  end

  def edit
    finder
  end

  def update
    finder
    @battle.update(battle_params)
    if @battle.save
      redirect_to @battle
    else
      render :edit
    end
  end

  def destroy
    finder
    @battle.destroy
    redirect_to battles_path
  end

  private

    def battle_params
      params.require(:battle).permit(:name, :location)
    end

    def finder
      @battle=Battle.find(params[:id])
    end

end
