Rails.application.routes.draw do
  resources :goals, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get 'requests/password_forget_request'
  get 'requests/password_forget_resetting'
  get 'requests/withdrawal'
  get 'requests/after_withdrawal'

  devise_for :users
  root 'contents#index'
  get 'contents/show'
  get "contents/home"
  get "contents/question"
  get "contents/contact"
  get "contents/agreement"
  get "contents/help"
  get 'contents/egogram_explanation'
  get 'contents/egogram_example'
  get 'contents/diary_explanation'

  get 'egograms/test'
  get 'egograms/result'
  get 'egograms/confirmation'


  get "goals/index"
  get "goals/:id", to: "goals#show"
  get 'goals/new'
  get "goals/edit"
  post "/goals",to: "goals#create"

#  get 'goals/fix_and_dalete'

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
