Rails.application.routes.draw do

  resources :users
  resources :sessions
  match "/logout" => "sessions#logout", :via => :post, :as => :logout

  resources :leagues do
    resources :teams, only: [:index, :show]
    resources :players, only: [:index, :show, :create, :update]
    resources :positions, only: [:index, :show]
  end
  resources :rankings, only: [:index]

  resources :fantasy_draft_styles, only: [:index, :show]

  resources :fantasy_drafts do
    resources :fantasy_teams
    resources :fantasy_draft_picks
  end

  get 'fantasy_drafts/:id/panel', :to => 'fantasy_drafts#panel'
  get 'fantasy_drafts/:url/:password', :to => 'fantasy_drafts#board'

end
