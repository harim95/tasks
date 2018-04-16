Rails.application.routes.draw do
  # get 'activity/index'
root :to => 'activities#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  #
  resources :activities do
    collection do
  get :update

end
    end
  end