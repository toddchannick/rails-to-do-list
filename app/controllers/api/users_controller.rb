class Api::UsersController < ApiController
   before_filter :authenticated?

   def index
     users = User.all
     render json: users, each_serializer: UserSerializer
   end

   def create
     user = User.new(user_params)
     if user.save
       render json: user
     else
       render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
     end
   end

   private

   def user_params
     params.require(:user).permit(:name, :email, :password)
   end

 end
