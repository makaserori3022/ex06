# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  helper_method :current_cart   # ビューでも使えるようにする

  private

  def current_cart
    if session[:cart_id]
      cart = Cart.find_by(id: session[:cart_id])
      # 万一、DBから削除されている等で見つからない場合に備えて
      if cart.nil?
        cart = Cart.create
        session[:cart_id] = cart.id
      end
    else
      cart = Cart.create
      session[:cart_id] = cart.id
    end
    cart
  end
end
