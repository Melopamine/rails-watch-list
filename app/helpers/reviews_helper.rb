module ReviewsHelper
  def display_stars(rating)
    rating ||= 0  # Set rating to 0 if it's nil
    filled_stars = '<i class="fa-solid fa-star"></i>' * rating
    empty_stars = '<i class="fa fa-star"></i>' * (5 - rating)
    filled_stars + empty_stars
  end
end
