class TasksController < ApplicationController
  include ActionView::Helpers::DateHelper

  def show
    @tasks = current_user.tasks
    @task = Task.new
  end

  def new
    @tasks = Task.all
    @task = Task.new
  end

   def create
     @task = Task.new(task_params)
     @task.user = current_user

     #@from_time = Time.now
     #@deadline = distance_of_time_in_words(@from_time, 7.days.from_now)
     #puts "NOTICE! Deadline is #{@deadline}"

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

    def countdown
      @task = Task.find(params[:id])
    end

   def task_params
     params.require(:task).permit(:description)
   end

end
