class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :likes, :unlikes, :load_comments]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @user = current_user.posts
    #@comment = Comment.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save!
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    # @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def likes
    current_user.like!(@post)
    render :like_button
    # redirect_to :back, notice: "Liked this post successfully!"
  end

  def unlikes
    current_user.unlike!(@post)
    render :like_button
    # redirect_to :back, notice: "Unliked this post successfully!"
  end

  def load_comments
    @comments = Comment.order(created_at: :desc).where('id < ?', params[:comment_id]).limit(3)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post

      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:name, :description, :image, :comment_id)
    end
end
