class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy], except: [:new]

  # GET /posts
  def index
    @posts = Post.all
  end
  
  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new 
    if user_signed_in?
      @post = Post.new
    else
      flash[:error] = "You must be registered to post a nowt!"
      redirect_to(register_path)
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.increment(:update_count) && @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end

end
