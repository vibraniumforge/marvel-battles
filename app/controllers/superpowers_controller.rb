class SuperpowersController < ApplicationController

  def index
    @superpowers=Superpower.all
  end

  def show
    find_superpower
  end

  def new
    @superpower=Superpower.new
  end

  def create
    
    @superpower=Superpower.create(name: params[:superpower][:name], character_id: params[:character][:id])
    @superpower.save
    if @superpower.save
      redirect_to superpowers_path(@superpower)
    else
      render :new
    end
  end

  def edit
    find_superpower
  end

  def update
    find_superpower
    @superpower.update(superpower_params)
    if @superpower.save
      redirect_to superpower_path(@superpower)
    else
      render :edit
    end
  end

  def destroy
    find_superpower
    @superpower.destroy
    redirect_to superpowers_path
  end

  private

    def superpower_params
      params.require(:superpower).permit(:name, :character_id)
    end

    def find_superpower
      @superpower=Superpower.find(params[:id])
    end

end
