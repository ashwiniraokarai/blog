class CommentsController < ApplicationController
  def create
    #uncomment to reveal params when you submit a comment
    #raise params.inspect

    #post_id is part of your post_comments_path whose URL is /posts/:post_id/comments(.:format). see rails routes and it becomes evident.
    #you can also see post_id params hash for create action also has post_id on it's hash (after its based on rails routes)
    @post = Post.find(params[:post_id])

    @comment = @post.comments.build(comment_params)

    if @comment.save #redirect to show post page
        redirect_to @post, notice: "Comment created successfully"
    else
        # show post page has the comment form embedded in it, so user can retry posting a comment again
        redirect_to @post, alert: "Error creating comment. " + @comments.errors.full_messages.to_sentence
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    byebug
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to @post  #redirect to show page of post (so the page reloads with comment removed)
  end

  def comment_params
    params.require(:comment).permit(:author, :body, :email)
  end

  #we are not gonna need the show.html because comments are rendered within show.html of a post
end
