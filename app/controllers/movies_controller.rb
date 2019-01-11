class MoviesController < ApplicationController

  def index
    @movies=Movie.all
  end

  def show
    find_movie
  end

  def new
    @movie=Movie.new
  end

  def create
    @movie=Movie.create(movie_params)
    @movie.save
    if @movie
      redirect_to movies_path(@movie)
    else
      render :new
    end
  end

  def edit
    find_movie
  end

  def update
    find_movie
    @movie.update(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    find_movie
    @movie.destroy
    redirect_to movies_path
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :year)
    end

    def find_movie
      @movie=Movie.find(params[:id])
    end

end
