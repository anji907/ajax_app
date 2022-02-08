class PostsController < ApplicationController

  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content])
    redirecto_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    #postsテーブルのcheckedカラムを参照して戻り値が真偽値になる
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
  
end
