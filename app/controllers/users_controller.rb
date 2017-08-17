class UsersController < ApplicationController
  #before_filter :load_socializable

  def profile
    @posts = Post.all
  end

  def show
    @users = User.new
  end

  def follow
    # puts '123'
    # @prof = Profile.all
    # puts @prof
    # @user = @.find(params[:id])
    # current_user.follow!(@.id)
    # current_user.follow!(@  )
    # render json: { follow: true }
  end






  private
  def users_params
    params.require(:user).permit(:title, :content, :image)
  end


end
