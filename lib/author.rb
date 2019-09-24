class Author
  attr_accessor :name
  attr_reader :posts

  def initialize(name)
    @name = name
    @posts = []
  end

  def posts
    Post.all.select {|p| p.author == self}
  end

  def add_post(post)
    @posts << post
    post.author = self
  end

  def add_post_by_title(title)
    post = Post.new(title)
    @posts << post
    post.author = self
    add_post(post)
  end

  def self.post_count
    Post.all.count
  end


  
end