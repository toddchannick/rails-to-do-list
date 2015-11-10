class UsersController < ApplicationController

  def show
    @user = current_user
    @date = current_user.created_at
    @created_date = @date.strftime("%B #{@date.day.ordinalize}, %Y")
  end

end
