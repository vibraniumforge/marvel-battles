class CharactersController < ApplicationController

  def show
    finder
  end

  def index
    @characters=Character.all
  end

  def new
    @character=Character.new
  end

  def create
    @character=Character.create(character_params)
    if @character.save
      render :index
    else
      render :new
    end
  end

  def edit
    finder
  end

  def update
    finder
    @character.update(character_params)
    if @character.save
      redirect_to @character
    else
      render :edit
  end

  def destroy
    finder
    @character.destroy
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :callsign)
  end

  def finder
    @character=Character.find(params[:id])
  end

end
