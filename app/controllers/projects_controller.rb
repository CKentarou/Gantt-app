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
  

  def show
    @project = Project.find(params[:id])
  end

  private

  # ストロングパラメータ
  def project_params
    params.require(:project).permit(:text, :start_date, :duration)
  end
end
