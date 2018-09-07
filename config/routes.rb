Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :dishes do
    collection do
      get :course_dishes
    end
  end

  root 'dishes#index'
end
