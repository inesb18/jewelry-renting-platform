class ProductReviewsController < ApplicationController
  def create
    @review = ProductReview.new(product_review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.rating = params[:rating]
    authorize(@review)
    @review.rental = @product.rentals.first
    if @review.save
      redirect_to product_path(@product)
    else
      render '/products/show'
    end
  end

  private

  def product_review_params
    params.require(:product_review).permit(:content)
  end
end
