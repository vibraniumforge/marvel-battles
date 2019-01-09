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
    character=Character.create(post_params)
  end

  def edit
    finder
  end

  def update
    finder
  end

  def destroy
    finder
    @character.destroy
    redirect to '/'
  end

  private

  def post_params
    params.require(:character).permit(:name, :callsign)
  end

  def finder
    @battlcharactere=Character.find(params[:id])
  end

end
