class ReviewsController < ApplicationController

  expose(:review)
  expose(:product)

  def edit
  end

  def create
    review = Review.new(review_params)
    review.product_id = params[:product_id]
    review.user_id = current_user.id
    if review.save
      product.reviews << review
      notice = 'Review was successfully created.'
    else
      notice = "Couldn't create review"
    end
    redirect_to category_product_url(product.category, product), notice: notice
  end

  def destroy
    review.destroy
    redirect_to category_product_url(product.category, product), notice: 'Review was successfully destroyed.'
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end
