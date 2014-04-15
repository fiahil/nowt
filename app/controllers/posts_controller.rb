class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy], except: [:new]

  # GET /posts
  def index
      @posts = Post.all
  end
  
  # GET /posts/1
  def show
  end

  # GET /posts/1/edit
  def edit
    if @post.user != current_user
      redirect_to @post, alert: "You do not have permission to edit this nowt!"
    end
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    @post.user = current_user
    if @post.save
      @post.create_activity :create, owner: current_user
    else
      redirect_to '/profile', alert: "Please fill out the form correctly!"
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.increment(:update_count) && @post.update(post_params)
      @post.create_activity :update, owner: current_user
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    @post.create_activity :destroy, owner: current_user
    redirect_to posts_url
  end

  # Used for searching for a Post
  def search
    userInput = params[:q]
    if(userInput != "") 
      @posts = Post.where("title ilike ? or description ilike ?", "%#{params[:q]}%", "%#{params[:q]}%").all
      @posts += find_posts_with_tags
    else 
      @posts = Post.all
    end
    render action: "index"
  end
  
  def self.create_comment_activity(post, user)
    post.create_activity :comment, owner: user

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description, :tag_tokens, :picture, :category)
  end

 def find_posts_with_tags
    post_ids = []
    tags = Tag.where("name ilike ? or description ilike ?", "%#{params[:q]}%", "%#{params[:q]}%").all
    tags.each do |tag|
      query = PostTag.where(tag_id: tag)

      unless query.blank?
        post_ids += query.map { |x| x.post_id }
      end
    end
    
    return Post.find_all_by_id(post_ids)
  end


end
