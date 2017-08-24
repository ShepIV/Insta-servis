class UsersController < ApplicationController
  #before_filter
  before_action :set_user, only: [:show, :edit, :update, :destroy, :follow, :unfollow, :followers, :followees]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def new
    @user = User.new
  end

  def update
    respond_to do |format|
      if @users.update(users_params)
        format.html { redirect_to @user, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def follow
    current_user.follow!(@user) # => This assumes you have a variable current_user who is authenticated
    render :follow_button
  end

  def unfollow
    current_user.unfollow!(@user)
    render :follow_button
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers(User)
    @users = User.all
  end

  def followees
    @user = User.find(params[:id])
    @followees = @user.followees(User)
    @users = User.all
  end

  def news
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.require(:user).permit(:title, :content, :image, :avatar, :first_name, :second_name)
  end


end
