Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/my_block', :to => 'blocks#show'
    end
  end
end
