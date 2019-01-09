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
    superpower=Superpower.create(post_params)
  end

  def edit
    finder
  end

  def update
    finder
  end

  def destroy
    finder
    @superpower.destroy
    redirect_to '/'
  end

  private

    def post_params
      params.require(:superpower).permit(:location)
    end

    def finder
      @superpower=Superpower.find(params[:id])
    end
end
