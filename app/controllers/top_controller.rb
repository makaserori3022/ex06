class TopController < ApplicationController
  def main
    # 今は単に Products の一覧に飛ばすだけの例
    redirect_to products_path
  end
end
