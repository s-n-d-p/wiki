Rails.application.routes.draw do
  devise_for :users
  resources :articles
  root 'articles#index'
  get '/category/*query', :controller => 'articles', :action => 'show_category'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
