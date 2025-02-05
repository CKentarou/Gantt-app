class GanttController < ApplicationController
  def data
    project = Project.find(params[:project_id])
    tasks = project.tasks
    task_ids = tasks.pluck(:id)
    
    links = Link.where(source: task_ids).or(Link.where(target: task_ids))

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
