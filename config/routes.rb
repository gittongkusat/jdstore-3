Rails.application.routes.draw do
    devise_for :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'welcome#index'
    get 'all' => 'products#all'
    # root 'products#home'
    namespace :admin do
        resources :products
        resources :abouts
        resources :orders do
            member do
                post :cancel
                post :ship
                post :shipped
                post :return
            end
        end
    end
    resources :products do
        member do
            post :add_to_cart
        end
    end
    resources :abouts

    resources :carts do
        collection do
            delete :clean
            post :checkout
        end
    end

    resources :orders do
        member do
            post :pay_with_alipay
            post :pay_with_wechat
            post :apply_to_cancel
        end
    end
    resources :cart_items do
        member do
            post :add_quantity
            post :remove_quantity
        end
    end
    namespace :account do
        resources :orders
    end
end
