class SuperpowersController < ApplicationController

  before_action :find_superpower, only: [:update, :show, :edit, :delete]

  def index
    @superpowers=Superpower.all
  end

  def show
  end

  def new
    @superpower=Superpower.new
  end

  def create
    @superpower=Superpower.create(superpower_params)
    @superpower.save
    if @superpower.save
      redirect_to superpowers_path(@superpower)
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

end
