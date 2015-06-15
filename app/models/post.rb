class Post < ActiveRecord::Base
  def self.find_newest_article
    @new_posts = Post.order(created_at: :DESC).limit(5)
  end
end
