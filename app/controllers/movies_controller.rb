class MoviesController < ApplicationController

  before_action :find_movie, only: [:update, :show, :edit, :destroy]

  def index
    @movies=Movie.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @movies}
    end
  end

  def show
    find_movie
    respond_to do |format|
      format.json {render json: @movie}
      format.html {render :show}
    end
  end

  def new
    @movie=Movie.new
  end

  def create
    @movie=Movie.create(movie_params)
    if @movie.save
      respond_to do |format|
        format.html {redirect_to movies_path}
        format.json {render json: @movie}
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    @movie.update(movie_params)
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  def recent
    @movies=Movie.all.order(year: :desc).limit(5)
  end

  private

    def movie_params
      params.require(:movie).permit(:name, :year)
    end

    def find_movie
      @movie=Movie.find(params[:id])
    end

end
