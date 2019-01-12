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
   
    @battle = Battle.create(name: params[:battle][:name], location: params[:battle][:location], movie_id: params[:movie][:id], character_id: params[:character][:id])
    binding.pry
    @battle.save
    binding.pry
    if @battle.save
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
      params.require(:battle).permit(:name, :location, :movie_id, :character_id)
    end

    def find_battle
      @battle=Battle.find(params[:id])
    end

end
