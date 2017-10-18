Rails.application.routes.draw do
  root 'welcome#index'
  get '/search', to: "search#index"
  post '/search/index', to: "search#index"
end
