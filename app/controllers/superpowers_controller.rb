class SuperpowersController < ApplicationController

  before_action :find_superpower, only: [:update, :show, :edit, :delete]
  before_action :find_character, only:[:index, :new, :create, :update]

  def index
    @superpowers=@character.superpowers
  end

  def show
  end

  def new
    @superpower=Superpower.new
  end

  def create
    @superpower=@character.superpowers.build(superpower_params)
    if @superpower.save
      redirect_to character_superpowers_path(@character)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @superpower.update(superpower_params)
    if @superpower.save
      redirect_to superpower_path(@superpower)
    else
      render :edit
    end
  end

  def destroy
    @superpower.destroy
    redirect_to superpowers_path
  end

  private

    def superpower_params
      params.require(:superpower).permit(:name)
    end

    def find_superpower
      @superpower=Superpower.find(params[:id])
    end

    def find_character
      @character=Character.find(params[:character_id])
    end

end
