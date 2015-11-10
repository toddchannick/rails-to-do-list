class TasksController < ApplicationController

  def show
    @tasks = current_user.tasks
  end


 def create
   @task = Task.new(task_params)
   @task.user = current_user

   if @task.save
     flash[:notice] = "Task was saved."
   else
     flash[:error] = "There was an error saving the task. Please try again."
   end

   respond_to do |format|
     format.html
     format.js
   end

 end

 def destroy
   @task = Task.find(params[:id])

   if @task.destroy
     flash[:notice] = "Task was deleted."
   else
     flash[:error] = "Task couldn't be deleted. Try again."
   end

   respond_to do |format|
     format.html
     format.js
   end
 end

  private

 def task_params
   params.require(:task).permit(:description)
 end

end
