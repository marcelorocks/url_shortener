Rails.application.routes.draw do
  resources :short_urls, only: :create
  get '/:hash', to: 'main#translate', as: :translate
  root to: 'main#index'
end
