Rails.application.routes.draw do
  get 'seach/index'

  root 'welcome#index'
  get '/search', to: "search#index"
end
