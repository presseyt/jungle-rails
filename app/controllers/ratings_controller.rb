class RatingsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.create(rating_params)
    @rating.user = current_user
    if (@rating.save)
      redirect_to product_path(@product)
    else
      render product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.find(params[:id])
    @rating.destroy
    redirect_to product_path(@product)
  end

  before_filter do
    throw :error unless current_user
  end

  private
  def rating_params
    params.require(:rating).permit(:rating, :description)
  end
end
