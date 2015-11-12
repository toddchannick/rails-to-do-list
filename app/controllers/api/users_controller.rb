class Api::UsersController < Api::BaseController
  before_action :authenticated?

   def index
     users = User.all
     render json: users
   end

 end
