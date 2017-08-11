class UsersController < ApplicationController
  #before_filter :load_socializable

  def profile
    @posts = Post.all
  end

  def show
    @users = User.new
  end

  def follow
    current_user.follow!(@socializable)
    render json: { follow: true }
  end

  def unfollow
    current_user.unfollow!(@socializable)
    render json: { follow: false }
  end




  private
  def users_params
    params.require(:user).permit(:title, :content, :image)
  end


end
