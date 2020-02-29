Rails.application.routes.draw do
  resources :posts do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   resources :comments  #ASH: adding the do-block and resources: comments to tell Rails
                        #that comments are only available inside of a post a.k.a adding a Nested Resource. This
                        #In rails, resources correspond to models. So you need to define resources besides defining the models.
                        #Rails creates routes for each of the 7 RESTful routes for comments, although we don't need all
  end

  root "posts#index"
end
