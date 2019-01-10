class CharactersController < ApplicationController

  def show
    finder
  end

  def index
    binding.pry
    @characters=Character.all
    binding.pry
  end

  def new
    @character=Character.new
    binding.pry
  end

  def create
    @character=Character.create(character_params)
    binding.pry
    if @character.save
      binding.pry
      render :show
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
    binding.pry
    @character=Character.find(params[:id])
  end

end
