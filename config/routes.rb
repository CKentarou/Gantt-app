Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  resources :projects do
    member do
      get :gantt
    end
  end
  
  scope '/api' do
    get "/projects/:project_id/data", to: "gantt#data"
    
    post "/projects/:project_id/task", to: "tasks#add"
    put "/projects/:project_id/task/:id", to: "tasks#update"
    delete "/projects/:project_id/task/:id", to: "tasks#delete"

    post "/projects/:project_id/link", to: "links#add"
    put "/projects/:project_id/link/:id", to: "links#update"
    delete "/projects/:project_id/link/:id", to: "links#delete"
  end
end
