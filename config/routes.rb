Periphery::Application.routes.draw do
  get '/show' => 'main#show'
  get '/search' => 'main#search', as: 'search'
  root 'main#index'
end