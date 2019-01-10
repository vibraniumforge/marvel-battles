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
    @movie=Movie.create(movie_params)
    if @movie.save
      render :index
    else
      render :new
    end
  end

  def edit
    finder
  end

  def update
    finder
    @movie.update(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :edit
    end
  end

  def destroy
    finder
    @movie.destroy
    redirect_to movies_path
  end

  private

    def movie_params
      params.require(:movie).permit(:location, :year)
    end

    def finder
      @movie=Movie.find(params[:id])
    end
end
