Rails.application.routes.draw do
  resources :offers
  resources :portfolios, only: [:index, :edit, :update]
  devise_for :programmers, controllers: { registrations: 'programmers/registrations',
                                          sessions: 'programmers/sessions', unlocks: 'programmers/unlocks',
                                          passwords: 'programmers/passwords', confirmations: 'programmers/confirmations'}
  root "home#index"
  resources :projects
  devise_for :customers, controllers: { registrations: 'customers/registrations',
                                     sessions: 'customers/sessions', unlocks: 'customers/unlocks',
                                     passwords: 'customers/passwords', confirmations: 'customers/confirmations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
