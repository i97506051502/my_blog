class Post < ActiveRecord::Base
  belongs_to :category
  paginates_per 5
  def self.find_newest_article
    @new_posts = Post.order(created_at: :DESC).limit(5)
  end
  def pub_date
    created_at.strftime('%Y年%m月%d日 %H:%M:%S')
  end
end
