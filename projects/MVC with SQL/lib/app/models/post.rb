require 'pry-byebug'
class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    result = DB.execute("SELECT * FROM posts WHERE id = ?", id).flatten
    post = Post.new(id: id, title: result[1], url: result[2], votes: result[3])
    post.title.nil? ? nil : post
  end

  def self.all
    all = DB.execute("SELECT * FROM posts")
    posts = []
    all.each do |post|
      posts << Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
    end
    posts
  end

  def save
    # binding.pry
    if @id
      DB.execute("UPDATE posts SET title = ?, url = ?, votes = ? WHERE id = ?", @title, @url, @votes, @id)
    else
      DB.execute("INSERT INTO posts (url, votes, title) VALUES (?, ?, ?)", @url, @votes, @title)
      @id = DB.last_insert_row_id
    end
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = #{id}")
  end
end
