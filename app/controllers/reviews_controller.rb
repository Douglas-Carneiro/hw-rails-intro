class ReviewsController < ApplicationController
  before_filter :has_moviegoer_and_movie, :only => [:new, :create]

  protected
  def has_moviegoer_and_movie
    unless @current_user
      flash[:warning] = 'You must be logged in to create a review.'
      redirect_to login_path
    end
    unless (@movie = Movie.find_by(:id => params[:movie_id]))
      flash[:warning] = 'Review must be for an existing movie.'
      redirect_to movies_path
    end
  end

  public
  def new
    @review = @movie.reviews.build
  end

  def create
    # since moviegoer_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.
    @current_user.reviews << @movie.reviews.build(review_params)
    redirect_to movie_path(@movie)
  end

  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def edit
    @review = Review.where(:movie_id => params[:movie_id], :id => params[:id]).first
    @movie = Movie.find_by(:id => params[:movie_id])
  end

  def update
    @review = Review.find params[:id]
    @review.update_attributes!(review_params)
    flash[:notice] = "Review for #{@review.movie.title} was successfully updated."
    redirect_to movie_path(@review.movie)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review for '#{@review.movie.title}' deleted."
    redirect_to movie_path(@review.movie)
  end

  private
  def review_params
    params.require(:review).permit(:potatoes, :comments)
  end
end