Rails.application.routes.draw do

  resources :users
  resources :sessions
  match "/logout" => "sessions#logout", :via => :post, :as => :logout

  resources :leagues do
    resources :teams, only: [:index, :show]
    resources :players, only: [:index, :show, :create, :update]
    resources :positions, only: [:index, :show]
  end

  resources :fantasy_draft_styles, only: [:index, :show]

  resources :fantasy_leagues do
    resources :fantasy_drafts
    resources :fantasy_teams
  end

end
