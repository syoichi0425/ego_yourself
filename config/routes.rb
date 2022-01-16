Rails.application.routes.draw do
  get 'requests/password_forget_request'
  get 'requests/password_forget_resetting'
  get 'requests/withdrawal'
  get 'requests/after_withdrawal'

  devise_for :users
  root 'pages#index'
  get 'pages/show'
  get "pages/home"
  get "pages/question"
  get "pages/inquiry"
  get "pages/agreement"
  get "pages/help"

  get 'egograms/test'
  get 'egograms/result'
  get 'egograms/confirmation'

  get 'contents/egogram_explanations'
  get 'contents/egogram_examples'
  get 'contents/diary_explanations'

  get 'goals/new'
  get 'goals/fix_and_dalete'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
