class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :js

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    # current_user.follow!(@profile.user)

    # @profile = Profile.find(params[:id])
    # current_user.unfollow!(@profile.user)
  end


  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  # POST /profiles.json
  def create

    @profile = current_user.build_profile(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def follow
  #   user = User.find(params[:id])
  #   current_user.toggle_follow!(user) # => This assumes you have a variable current_user who is authenticated
  # end

  def follow
    user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
      end
    current_user.follow!(user) # => This assumes you have a variable current_user who is authenticated

  end

  def unfollow
    user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.js
      end
    current_user.unfollow!(user)
  end

    # def unfollow
    #   user = User.find(params[:id])
    #   current_user.stop_following(user)
    # end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:avatar, :first_name, :second_name, :user_id)
  end
  end



