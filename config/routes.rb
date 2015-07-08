Rails.application.routes.draw do
  resources :leagues do
    resources :teams, only: [:index, :show]
    resources :players, only: [:index, :show, :create, :update]
    resources :positions, only: [:index, :show]
  end

  resources :fantasy_draft_styles, only: [:index, :show]
end
