class ReviewsController < ApplicationController
  before_action :require_signin
  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    respond_to do |format|
      if @review.save
        format.html { redirect_to movie_reviews_path(@movie), notice: "Thanks for your review!" }
        format.js
      else
        format.html { render :new }
        format.js { render :errors }
      end
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @movie, notice: "Review successfully deleted!"
  end

  def edit
    @review = Review.find(params[:id])  
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to movie_reviews_path(@movie), notice: "Review successfully updated!"
    else
      render :edit
    end
  end

  private
    def review_params
      params.require(:review).permit(:stars, :comment)
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
end
