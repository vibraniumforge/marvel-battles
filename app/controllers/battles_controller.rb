class BattlesController < ApplicationController

  def index
    @battles=Battle.all
  end

  def show
    find_battle
  end

  def new
    @battle=Battle.new
  end

  def create
    @battle=Battle.create(battle_params)
    @battle.save
    if @battle
      redirect_to battles_path(@battle)
    else
      render :new
    end
  end

  def edit
    find_battle
  end

  def update
    find_battle
    @battle.update(battle_params)
    if @battle.save
      redirect_to battle_path(@battle)
    else
      render :edit
    end
  end

  def destroy
    find_battle
    @battle.destroy
    redirect_to battles_path
  end

  private

    def battle_params
      params.require(:battle).permit(:name, :location)
    end

    def find_battle
      @battle=Battle.find(params[:id])
    end

end
