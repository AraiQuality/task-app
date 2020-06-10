class TasksController < ApplicationController
  
  before_action :set_user
  
  def index
    @tasks = @user.tasks
  end
  
  def create
  end
  
  def new
  end
  
  def edit
  end
  
  def show
  end
  
  def update
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
    redirect_to user_task_url
  end

  private
    
    def task_params
      params.require(:task).permit(:title, :note, :user_id)
    end
end
