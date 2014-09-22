Rails.application.routes.draw do
    devise_for :admins
    get 'admins/view_db', to:'admin#view_db'
    

    root to:'home#index'
end
