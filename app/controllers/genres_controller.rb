class GenresController < ApplicationController
  before_action :require_signin, except: [:show, :index]
  before_action :require_admin, except: [:show, :index]
  before_action :set_genre, only: [:show, :edit, :update, :destroy]

  def index
    @genres = Genre.all
  end

  def show
    @movies = @genre.movies
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_url, notice: "Genre successfully created!"
    else
      render :new, alert: "Unable to save Genre!"
    end
  end

  def edit
  end

  def update
    if @genre.update(genre_params)
      redirect_to genres_url, notice: "Genre successfully updated!"
    else
      render :edit, alert: "Unable to update Genre!"
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_url, alert: "Genre successfully deleted!"
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def set_genre
      @genre = Genre.find_by!(slug: params[:id])
    end
end
