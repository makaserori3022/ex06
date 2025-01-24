# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new
  end

  def create
    cart = current_cart
    product = Product.find(params[:cart_item][:product_id])

    # すでに同じ商品がカートに入っていれば数量だけ足す例
    existing_item = cart.cart_items.find_by(product_id: product.id)
    if existing_item
      existing_item.quantity += params[:cart_item][:quantity].to_i
      existing_item.save
    else
      cart.cart_items.create(
        product_id: product.id,
        quantity: params[:cart_item][:quantity]
      )
    end

    redirect_to cart_path(cart), notice: "カートに商品を追加しました。"
  end

  def destroy
    cart = current_cart
    cart_item = cart.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to cart_path(cart), notice: "カートから商品を削除しました。"
  end
end
