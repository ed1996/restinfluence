Rails.application.routes.draw do
  devise_for :influencers, :path=>'influencers',
                            :controllers=>{ sessions: 'influencers/sessions'}
  devise_for :restorers, :path=>'',
                          :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                          :controllers=>{:registrations=>'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  resources :restorers, only: [:show]
  resources :restaurants do
    resources :menus
  end
  resources :photos
end
