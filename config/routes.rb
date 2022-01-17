Rails.application.routes.draw do
  get 'requests/password_forget_request'
  get 'requests/password_forget_resetting'
  get 'requests/withdrawal'
  get 'requests/after_withdrawal'

  devise_for :users
  root 'contents#index'
  get 'contents/show'
  get "contents/home"
  get "contents/question"
  get "contents/inquiry"
  get "contents/agreement"
  get "contents/help"

  get 'egograms/test'
  get 'egograms/result'
  get 'egograms/confirmation'

  get 'contents/egogram_explanation'
  get 'contents/egogram_example'
  get 'contents/diary_explanation'

  get 'goals/new'
  get 'goals/fix_and_dalete'



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
