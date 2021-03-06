Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'blocks/get_block', :to => 'blocks#get_block'
      get 'blocks/', :to => 'blocks#get_block'
      resources :blocks, :only => :show
      resources :pins, :only => [:index, :show]
    end
  end
end
