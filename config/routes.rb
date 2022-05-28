Rails.application.routes.draw do
  # get "goals/edit"
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # resources :users carrierwaveの設定でNo route matches [PATCH]を修正するため設定
  # https://qiita.com/hatorijobs/items/50f23b3b8e4761914851
  resources :users, only: %i[show index update destroy]
  resources :contacts, only: %i[new create]
  resources :contents, only: %i[new index create]
  resources :diaries, only: %i[new index create edit update destroy]
  resources :goals, only: %i[index new create edit update destroy]
  resources :egograms, only: %i[new index edit destroy]


  root to: 'contents#home'
  #  get"contents/:id/user_page" to "contents#user_page"
  #   post "/contents/create",to: "contents#create"
  # # contents_create POST   /contents/create(.:format) contents#create
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

  # get "diaries/new"
  # get "diaries/index"
  # post "/diaries",to: "diaries#create"

  get 'egograms/new'
  # get "egograms/:id"
  # post "/egograms",to: "egograms#create"
  # get "egograms/index"
  get 'egograms/show'
  patch '/egograms/:id/edit', to: 'egograms#update'
  get 'egograms/test'
  get 'egograms/test2'
  get 'egograms/result'
  get 'egograms/confirmation'

  # delete 'egograms/:id' => 'egograms#destroy'

  post '/egograms/test', to: 'egograms#create'

  # get "goals/index"
  # get "goals/show"
  # get "goals/:id", to: "goals#show"
  # get "goals/new"
  # get "goals/edit"
  # post "/goals",to: "goals#create"

  # get "goals/fix_and_dalete"

  get 'requests/password_forget_request'
  get 'requests/password_forget_resetting'
  get 'requests/withdrawal'
  get 'requests/after_withdrawal'

  get 'otameshis/otameshi'


  get "search" => "searches#search"

end
