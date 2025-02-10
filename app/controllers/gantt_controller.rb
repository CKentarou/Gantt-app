class GanttController < ApplicationController
  # CSRF対策を無効にする（APIエンドポイントとして使用するため）
  protect_from_forgery with: :null_session

  # プロジェクトのタスクとリンクをJSON形式で返すアクション
  def data
    # パラメータからプロジェクトを取得
    project = Project.find(params[:project_id])
    
    # プロジェクトに関連するタスクを取得
    tasks = project.tasks
    
    # タスクのIDを配列として取得
    task_ids = tasks.pluck(:id)
    
    # タスクに関連するリンクを取得
    links = Link.where(source: task_ids).or(Link.where(target: task_ids))

    # タスクとリンクをJSON形式でレンダリング
    render json: {
      data: tasks.map { |task| 
        {
          id: task.id,
          text: task.text,
          start_date: task.start_date.to_formatted_s(:db),
          duration: task.duration,
          progress: task.progress,
          parent: task.parent,
          open: true
        }
      },
      links: links.map { |link|
        {
          id: link.id,
          source: link.source,
          target: link.target,
          type: link.link_type
        }
      }
    }
  end
end
