Rails.application.routes.draw do
  # Deviseによるユーザー認証のルーティング
  devise_for :users

  # アプリケーションのルートパスをホームコントローラーのトップアクションに設定
  root to: "homes#top"

  # アバウトページのルーティング
  get "about" => "homes#about"

  # ユーザーリソースのルーティング（インデックスアクションのみ）
  resources :users, only: [:index]
  
  # プロジェクトリソースのルーティング
  resources :projects do
    member do
      # プロジェクトのガントチャート表示用のルーティング
      get :gantt
    end
  end
  
  # APIエンドポイントのルーティング
  scope '/api' do
    # プロジェクトのデータ取得用のルーティング
    get "/projects/:project_id/data", to: "gantt#data"
    
    # タスクの追加、更新、削除用のルーティング
    post "/projects/:project_id/task", to: "tasks#add"
    put "/projects/:project_id/task/:id", to: "tasks#update"
    delete "/projects/:project_id/task/:id", to: "tasks#delete"

    # リンクの追加、更新、削除用のルーティング
    post "/projects/:project_id/link", to: "links#add"
    put "/projects/:project_id/link/:id", to: "links#update"
    delete "/projects/:project_id/link/:id", to: "links#delete"
  end
end
