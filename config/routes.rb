Rails.application.routes.draw do

  # get "goals/edit"


  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/users', to: redirect("/users/sign_up")
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  # resources :users carrierwaveの設定でNo route matches [PATCH]を修正するため設定
  # https://qiita.com/hatorijobs/items/50f23b3b8e4761914851
  # resources :users,    only: %i[ index update destroy]
  resources :contacts, only: %i[new create]
  resources :contents, only: %i[new index create]
  resources :diaries,  only: %i[new index create edit update destroy]
  resources :goals,    only: %i[new index create edit update destroy]
  resources :egograms, only: %i[new index edit destroy]
  resources :weeks,    only: %i[new index create edit update destroy]




  root to: 'contents#home'
  get 'contents/question'
  get 'contents/contact'
  get 'contents/agreement'
  get 'contents/help'
  get 'contents/egogram_explanation'
  get 'contents/egogram_example'
  get 'contents/diary_explanation'
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'

  get 'egograms/new'
  get 'egograms/show'
  patch '/egograms/:id/edit', to: 'egograms#update'
  get 'egograms/test'
  get 'egograms/test2'
  get 'egograms/result'
  get 'egograms/confirmation'
  post '/egograms/test', to: 'egograms#create'

  get 'requests/password_forget_request'
  get 'requests/password_forget_resetting'
  get 'requests/withdrawal'
  get 'requests/after_withdrawal'

  # get 'otameshis/otameshi'

  get "search" => "searches#search"

  # get 'weeks/index'
  get 'weeks/new'
  get 'weeks/create'
  get 'weeks/edit'
  get 'weeks/show'
  get 'weeks/update'
  get 'weeks/destroy'

end