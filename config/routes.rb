Periphery::Application.routes.draw do
  get '/show' => 'main#show'
  get '/search', to: 'main#search', as: 'search'
  root 'main#search'
  # root 'main#show'
end
