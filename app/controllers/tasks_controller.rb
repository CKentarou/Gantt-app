class TasksController < ApplicationController
  protect_from_forgery with: :null_session

  def update
      task = Task.find(params["id"])
      task.text = params["text"]
      task.start_date = params["start_date"]
      task.duration = params["duration"]
      task.progress = params["progress"] || 0
      task.parent = params["parent"]
      task.save

      render :json => {:action => "updated"}
  end

  def add
      task = Task.create( 
          :text => params["text"], 
          :start_date=> params["start_date"], 
          :duration => params["duration"],
          :progress => params["progress"] || 0, 
          :parent => params["parent"],
          :project_id => params["project_id"]
      )

      render :json => {:action => "inserted", :tid => task.id}
  end

  def delete
      Task.find(params["id"]).destroy
      render :json => {:action => "deleted"}
  end
end