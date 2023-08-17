class ReviewsController < ApplicationController
  include ReviewsHelper

  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show' # Renders the list's show view if there's an error saving the review
    end
  end

  def display_stars(rating)
    filled_stars = '<i class="fa-solid fa-star"></i>' * rating
    empty_stars = '<i class="fa fa-star"></i>' * (5 - rating)
    filled_stars + empty_stars
  end

  private

  def review_params
  params.require(:review).permit(:content, :rating)
  end
end
