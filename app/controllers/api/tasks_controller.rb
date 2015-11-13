class Api::TasksController < ApiController
   before_filter :authenticated?

   #show list of tasks
   def index
     tasks = @logged_user.tasks
     render json: tasks, each_serializer: TaskSerializer
   end

   def show
     task = @logged_user.tasks.find(params[:id])
     render json: task.to_json, status: 200
   end

   def update
     task = @logged_user.tasks.find(params[:id])

     if task.update_attributes(task_params)
       render json: task.to_json, status: 200
     else
       render json: {error: "Task update failed", status: 400}, status: 400
     end
   end

   def create
     task = Task.new(task_params)
     task.user = @logged_user

     if task.valid?
       task.save!
       render json: task.to_json, status: 201
     else
       render json: {error: "Task is invalid", status: 400}, status: 400
     end
   end

   def destroy
     task = @logged_user.tasks.find(params[:id])

     if task.destroy
       render json: {message: "Task destroyed", status: 200}, status: 200
     else
       render json: {error: "Task destroy failed", status: 400}, status: 400
     end
   end

   private

   def task_params
     params.require(:task).permit(:description)
   end


 end
