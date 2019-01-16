class BattlesController < ApplicationController

  before_action :find_battle, only: [:update, :show, :edit, :delete]

  def index
    @battles=Battle.all
  end

  def show
  end

  def new
    @battle=Battle.new
  end

  def create
    binding.pry
    @battle=Battle.create(battle_params)
    binding.pry
    # @battle=Battle.create(battle: params[:battle][:name], location: params[:battle][:location], movie: params[:movie][:id], character: params[:character[:id]])
    binding.pry
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
      # params.require(:battle).permit(:name, :location, :character[:id], :movie[:id])
      # params.require(:battle).permit(:name, :location, :character_attributes => [:id], :movie_attributes => [:id])

      # params.require(:battle).permit(:name, :location, :character_attributes => [:id], :movie_attributes => [:id])
      # params.require(:battle).permit(:name, :location, :movie_id, :character_id )
      # params.require(:battle).permit(:name, :location, {:movie => [:id]}, {:character => [:id]})
      # params.require(:battle).permit(:name, :location, character_attributes => [:id],movie_attributes: [:id])
      
    end

    def find_battle
      @battle=Battle.find(params[:id])
    end

end
