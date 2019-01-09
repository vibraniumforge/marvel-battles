class MoviesController < ApplicationController

  def show
    finder
  end

  def index
    @movies=Movie.all
  end

  def new
    @movie=Movie.new
  end

  def create
    movie=Movie.create(post_params)
  end

  def edit
    finder
  end

  def update
    finder
  end

  def destroy
    finder
    @movie.destroy
    redirect_to '/'
  end

  private

    def post_params
      params.require(:movie).permit(:location)
    end

    def finder
      @movie=Movie.find(params[:id])
    end
end
