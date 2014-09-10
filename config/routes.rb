Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/blocks', :to => 'blocks#show'
    end
  end
end
