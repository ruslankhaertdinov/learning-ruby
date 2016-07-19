Rails.application.routes.draw do
  resources :feedbacks, only: %i(new create)
end
