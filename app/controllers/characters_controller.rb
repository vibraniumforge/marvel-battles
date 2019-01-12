class CharactersController < ApplicationController

def index
  @characters=Character.all
end

def show
  find_character
end

def new
  @haracter=Character.new
end

def create
  @character=Character.create(character_params)
  @character.save
  binding.pry
  if @character
    redirect_to characters_path(@character)
  else
    render :new
  end
end

def edit
  find_character
end

def update
  find_character
  @character.update(character_params)
  if @character.save
    redirect_to character_path(@character)
  else
    render :edit
  end
end

def destroy
  find_character
  @character.destroy
  redirect_to characters_path
end

private

  def character_params
    params.require(:character).permit(:name, :callsign)
  end

  def find_character
    @character=Character.find(params[:id])
  end

end
