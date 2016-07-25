Rails.application.routes.draw do
  resources :feedbacks, only: %i(new create)
  root "feedbacks#new"
end
