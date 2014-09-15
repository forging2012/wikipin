Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/my_block', :to => 'blocks#show'
      get '/pins', :to => 'pins#index'
    end
  end
end
