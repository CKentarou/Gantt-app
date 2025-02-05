class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      # プロジェクトの作成後にタスクを作成
      Task.create(
        text: @project.text,         # プロジェクトの名前をタスクの名前として使用
        start_date: @project.start_date,
        duration: @project.duration,
        progress: 0,                # タスクの進捗はデフォルトで 0
        parent: nil,                # 親タスクがない場合（必要に応じて設定）
        project_id: @project.id     # タスクにプロジェクトIDを関連付け
      )

      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  # ストロングパラメータ
  def project_params
    params.require(:project).permit(:text, :start_date, :duration, :parent, :progress)
  end
end
