Rails.application.routes.draw do
  get 'welcome/index'
  resources :citizens, except: [:destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
