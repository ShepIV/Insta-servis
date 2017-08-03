class UsersController < ApplicationController

  def profile

  end

  def show

  end

  def users_params
    params.require(:user).premit(:title, :content, :image)
  end
end
