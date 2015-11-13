class Api::UsersController < ApiController
   before_filter :authenticated?

   def index
     users = User.all
     render json: users, each_serializer: UserSerializer
   end

   def show
     user = User.find(params[:id])
     render json: user.to_json, status: 200
   end

   def create
     user = User.new(user_params)
     if user.save
       render json: user
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
   end

   def destroy
     begin
       user = User.find(params[:id])
       user.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :email, :password)
   end

 end
