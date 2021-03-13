Rails.application.routes.draw do
  root to: 'users#index'
  resources :groups, only: [:index, :show, :new, :create]
  get '/ext_logs' => 'time_logs#ext_logs'
  get '/splash' => 'users#splash'
  resources :time_logs, only: [:index, :show, :new, :create]
  devise_for :users

end
