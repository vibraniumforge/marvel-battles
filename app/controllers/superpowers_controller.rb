class SuperpowersController < ApplicationController

  def show
    finder
  end

  def index
    @superpowers=Superpower.all
  end

  def new
    @superpower=Superpower.new
  end

  def create
    @superpower=Superpower.create(superpower_params)
    if @superpower.save
      render :index
    else
      render :new
  end

  def edit
    finder
  end

  def update
    finder
    @superpower.update(superpower_params)
    if @superpower.save
      redirect_to @superpower
    else
      render :edit
    end
  end

  def destroy
    finder
    @superpower.destroy
    redirect_to superpowers_path
  end

  private

    def superpower_params
      params.require(:superpower).permit(:location)
    end

    def finder
      @superpower=Superpower.find(params[:id])
    end
end
