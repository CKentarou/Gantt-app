class ProjectsController < ApplicationController
  # プロジェクトの一覧を表示するアクション
  def index
    @projects = Project.joins(:project_users)
                       .where('projects.public = ? OR project_users.user_id = ?', true, current_user.id)
                       .distinct
  end

  # 新しいプロジェクトを作成するためのフォームを表示するアクション
  def new
    @project = Project.new
  end

  # 新しいプロジェクトを作成するアクション
  def create
    @project = Project.new(project_params)
    if @project.save
      # プロジェクト作成後にタスクを作成
      Task.create(
        text: @project.text,        
        start_date: @project.start_date,
        duration: @project.duration,
        progress: 0,                
        parent: nil,                
        project_id: @project.id     
      )
  
      # プロジェクト作成者をproject_usersに追加
      ProjectUser.create(
        project: @project,
        user: current_user, 
        role: "admin"
      )
  
      redirect_to project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # プロジェクトを更新するアクション
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # プロジェクトの詳細を表示するアクション
  def show
    @project = Project.find(params[:id])
  end

  # プロジェクトを削除するアクション
  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to root_path
  end

  private

  # ストロングパラメータを設定するメソッド
  def project_params
    params.require(:project).permit(:text, :start_date, :duration, :public)
  end
end
