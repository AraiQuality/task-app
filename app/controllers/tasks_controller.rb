class TasksController < ApplicationController
  
  before_action :set_user
  
  def new
  end
  
  def create
    @task = Task.new(title: params[:title],
                     note: params[:note],
                     user_id: params[:user_id])
    if @task.save
      flash[:success] = "タスクを作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def index
    @tasks = @user.tasks
  end
  
  def show
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(title: params[:title],
                               note: params[:note])
      flash[:success] = "タスクを更新しました。"
      redirect_to user_tasks_url @user
    else
      render :edit
    end
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
