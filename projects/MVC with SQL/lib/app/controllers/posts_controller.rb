require_relative "../models/post"
require_relative "../views/posts_view"
require 'pry-byebug'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    all = Post.all
    @view.display(all)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_for("title")
    url = @view.ask_for("url")
    votes = @view.ask_for("votes").to_i
    post = Post.new(title: title, url: url, votes: votes)
    post.save
    @view.show_greeting
    index
  end

  def update
    # TODO: implement updating an existing post
    index
    index_to_update = @view.ask_index
    title = @view.ask_for("title")
    url = @view.ask_for("url")
    votes = Post.find(index_to_update).votes
    post = Post.new(title: title, url: url, id: index_to_update, votes: votes)
    post.save
    @view.show_greeting
    index
  end

  def destroy
    index
    index_to_update = @view.ask_index
    post = Post.find(index_to_update)
    post.destroy
    post.save
    @view.show_greeting
    index
  end

  def upvote
    # TODO: implement upvoting a post
    index
    index_to_update = @view.ask_index
    votes = Post.find(index_to_update).votes
    title = Post.find(index_to_update).title
    url = Post.find(index_to_update).url
    post = Post.new(title: title, url: url, id: index_to_update, votes: votes + 1)
    post.save
    @view.show_greeting
    index
  end
end
