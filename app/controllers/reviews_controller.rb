class ReviewsController < ApplicationController
  # def index
  #   @reviews = Review.all
  # end

  # Could be deleted because of the embedded form in restaurant/:id
  def new
    @review = Review.new
    set_restaurant
  end

  def create
    @review = Review.new(review_params)
    set_restaurant
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), notice: "Review was successfully created"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
