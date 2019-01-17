class SuperpowersController < ApplicationController

  before_action :find_superpower, only: [:update, :show, :edit, :delete]

  def index
    find_character
    @superpowers=@character.superpowers
    binding.pry
  end

  def show
  end

  def new
    find_character
    @superpower=Superpower.new
   (@character.superpowers.size + 1).times {@superpower.build_character}
  #  (@character.superpowers.size + 1).times {@superpower.character.build}
    # @superpowers=Superpower.new
    # @superpowers=@character.superpowers
  end

  def create
    @superpower=Superpower.create(superpower_params)
    if @superpower.save
      redirect_to superpowers_path
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
      params.require(:superpower).permit(:name, [:character][:id])
    end

    def find_superpower
      @superpower=Superpower.find(params[:id])
    end

    def find_character
      @character=Character.find(params[:character_id])
    end

end
