Rails.application.routes.draw do
  devise_for :influencers, :path=>'influencers',
             controllers: {
                 sessions: 'influencers/sessions', registrations: 'influencers/registrations', passwords: 'influenceurs/passwords'
             }


  devise_for :restorers, :path=>'',
                          :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                          :controllers=>{:registrations=>'registrations',
                                        :confirmations=>'confirmations'
                          }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get 'your_trips'=>'reservations#your_trips'
  get 'your_reservation'=>'demands#your_reservation'
  get '/search'=>'pages#search'
  get '/searching'=>'pages#searching'

  resources :influencers, only: [:show]

  resources :restorers, only: [:show]

  resources :restaurants do
    resources :menus
    resources :reservations, only: [:create]
  end

  resources :photos

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

end
