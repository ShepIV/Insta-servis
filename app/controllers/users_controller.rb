class UsersController < ApplicationController

  def profile
    @posts = Post.all

  end

  def show
    @users = User.new
  end





  private
  def users_params
    params.require(:user).premit(:title, :content, :image)
  end
end
