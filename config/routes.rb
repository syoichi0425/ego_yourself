Rails.application.routes.draw do
  #get "goals/edit"
  devise_for :users
  resources :contacts, only: [:new, :create]
  resources :diaries, only:[:new,:index,:create,:edit,:update,:destroy]
  resources :goals, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :egograms, only: [:new,:edit]


  #"contents#index"
  get"contents/user_page"
  root :to =>  "contents#home"
  get "contents/question"
  get "contents/contact"
  get "contents/agreement"
  get "contents/help"
  get "contents/egogram_explanation"
  get "contents/egogram_example"
  get "contents/diary_explanation"

  get "done", to: "contacts#done", as: "done"
  post "contacts/confirm", to: "contacts#confirm", as: "confirm"
  post "contacts/back", to: "contacts#back", as: "back"

  # get "diaries/new"
  # get "diaries/index"
  # post "/diaries",to: "diaries#create"


  get "egograms/new"
# get "egograms/:id"
post "/egograms",to: "egograms#create"
  get "egograms/index"
  get "egograms/show"
  patch '/egograms/:id/edit', to: 'egograms#update'
  get "egograms/test"
  get "egograms/test2"
  get "egograms/result"
  get "egograms/confirmation"

  post "/egograms/test",to: "egograms#create"

  # get "goals/index"
  # get "goals/show"
  # get "goals/:id", to: "goals#show"
  # get "goals/new"
  # get "goals/edit"
  # post "/goals",to: "goals#create"

 #get "goals/fix_and_dalete"

  get "requests/password_forget_request"
  get "requests/password_forget_resetting"
  get "requests/withdrawal"
  get "requests/after_withdrawal"



  get "otameshis/otameshi"


end
