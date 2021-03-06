Rails.application.routes.draw do

  namespace :admin do
      resources :programmers
      resources :customers
      resources :software_engineerings
      resources :offers
      resources :portfolios
      resources :projects

      root to: "programmers#index"
    end
  # devise_for :software_engineerings
  root "home#index"


  get '/offers/new/:id', to: 'offers#new', as: 'new_offer'
  resources :offers, except: :new


  get 'projects/:id/:offer_id/accepted', to: 'projects#offer_accepted', as:'offer_accepted'
  get 'projects/:id/status', to: 'projects#update_status', as:'status_update'
  resources :projects


  resources :portfolios, only: [:index, :edit, :update]


  devise_for :programmers, controllers: { registrations: 'programmers/registrations',
                                          sessions: 'programmers/sessions', unlocks: 'programmers/unlocks',
                                          passwords: 'programmers/passwords', confirmations: 'programmers/confirmations'}


  devise_for :customers, controllers: { registrations: 'customers/registrations',
                                     sessions: 'customers/sessions', unlocks: 'customers/unlocks',
                                     passwords: 'customers/passwords', confirmations: 'customers/confirmations'}

  devise_for :software_engineerings, controllers: { registrations: 'software_engineerings/registrations',
                                          sessions: 'software_engineerings/sessions', unlocks: 'software_engineerings/unlocks',
                                          passwords: 'software_engineerings/passwords', confirmations: 'software_engineerings/confirmations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
