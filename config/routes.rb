Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #controller action
  root 'subs#index' # same as: get 'subs/index'
  
  
  resources :subs do
    resources :topics
  end

  # /subs/:sub_id/topics/:id
    # sub_id 7
    # topic_id 
      #id 4
    # /subs/7/topics/4


  # resources :subs, only: [:index, :show]
  # resources :subs, except: [:index, :show]
  # get '/subs', to: 'subs#index'
  # get '/subs/:id', to: 'subs#show'
  # get '/subs/:id', to: 'subs#edit' #form gets updated on front-end
  # get '/subs/:id', to: 'subs#update' #record/database gets updated
  # delete 'subs/:id', to: 'subs#destroy'

  # 7
  # get '/subs/7', to: 'subs#show'
end
