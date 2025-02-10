class TasksController < ApplicationController
  # CSRF対策を無効にする（APIエンドポイントとして使用するため）
  protect_from_forgery with: :null_session

  # タスクを更新するアクション
  def update
    # パラメータからタスクを取得し、属性を更新
    task = Task.find(params["id"])
    task.text = params["text"]
    task.start_date = params["start_date"]
    task.duration = params["duration"]
    task.progress = params["progress"] || 0
    task.parent = params["parent"]
    task.save

    # 更新アクションの結果をJSON形式で返す
    render :json => {:action => "updated"}
  end

  # タスクを追加するアクション
  def add
    # パラメータから新しいタスクを作成
    task = Task.create( 
      :text => params["text"], 
      :start_date => params["start_date"], 
      :duration => params["duration"],
      :progress => params["progress"] || 0, 
      :parent => params["parent"],
      :project_id => params["project_id"]
    )

    # 挿入アクションの結果をJSON形式で返す
    render :json => {:action => "inserted", :tid => task.id}
  end

  # タスクを削除するアクション
  def delete
    # パラメータからタスクを取得し、削除
    Task.find(params["id"]).destroy

    # 削除アクションの結果をJSON形式で返す
    render :json => {:action => "deleted"}
  end
end