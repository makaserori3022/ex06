Rails.application.routes.draw do
  # トップページは top#main にする
  root 'top#main'
  get 'top/main'

  # 商品の登録・一覧・削除
  resources :products, only: [:index, :new, :create, :destroy]

  # カートアイテムの追加・削除
  resources :cart_items, only: [:new, :create, :destroy]

  # カートの内容表示
  resources :carts, only: [:show]
end
