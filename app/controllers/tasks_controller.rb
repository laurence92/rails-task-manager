# As a user, I can list tasks
# As a user, I can view the details of a task
# As a user, I can add a new task
# As a user, I can edit a task (mark as completed / update title & details)
# As a user, I can remove a task

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  # this method is called by the form through the post in routes
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def show
    set_task
  end

  def edit
    set_task
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end
  

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_path
  end
  
  
  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
  
end
