class CharactersController < ApplicationController

  before_action :find_character, only: [:update, :show, :edit, :destroy]

  def index
    @characters=Character.all
  end

  def show
  end

  def new
    @character=Character.new
    @character.superpowers.build
  end

  def create
    @character=Character.create(character_params)
    if @character.save
      redirect_to characters_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @character.superpowers.destroy_all
    @character.update(character_params)
    if @character.save
      redirect_to character_path(@character)
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_path
  end

  private

    def character_params
      params.require(:character).permit(:name, :alias, superpowers_attributes:[:name])
    end

    def find_character
      @character=Character.find(params[:id])
    end

end
