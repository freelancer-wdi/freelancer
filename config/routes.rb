Rails.application.routes.draw do
  devise_for :customers, controllers: { registrations: 'customers/registrations',
                                     sessions: 'customers/sessions', unlocks: 'customers/unlocks',
                                     passwords: 'customers/passwords', confirmations: 'customers/confirmations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
