class BattlesController < ApplicationController

  before_action :find_battle, only: [:update, :show, :edit, :destroy]

  def index
    @battles=Battle.all
  end

  def show
  end

  def new
    @battle=Battle.new
  end

  def create
    @battle=Battle.create(battle_params)
    if @battle.save
      redirect_to battles_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @battle.update(battle_params)
    if @battle.save
      redirect_to battle_path(@battle)
    else
      render :edit
    end
  end

  def destroy
    @battle.destroy
    redirect_to battles_path
  end

  private

    def battle_params
      params.require(:battle).permit(:name, :location, :character_id, :movie_id)
    end

    def find_battle
      @battle=Battle.find(params[:id])
    end

end
