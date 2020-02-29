class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
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
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save   #if save, redirect to show page
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else    #if error, render /new form AGAIN so user can retry
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }  #ASH: when you call the page with .json extension
      else
        format.html { render :edit }  #ASH: Give the user a chance to make corrections on the edit form and retry update
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
      #parameters generally represent the part of the URL used to request a page or values from a form
      #they are accessible in the controller as a HASH named params and that's what params[:id] is referring to
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :author)
      #ASH: post is a key (and a hash!) in the params hash which makes it a nested hash.
      #title and body are keys within the post hash.
      #For example, in an update request(say, PATCH "/posts/4") this is how the params look in the logs:
      # Parameters:
      # {"authenticity_token"=>"CHsjVVgXOT/8kq5RCC5NHATEplCEBIC4e0BSigQfPvXrlT/5H2PaAnuRSYt3dTRSMckqZxTump2z9jlYykiy0g==",
      #   "post"=>{"title"=>"first post", "body"=>"updated body"},
      #   "commit"=>"Update Post", "id"=>"4"
      # }

    end
end
