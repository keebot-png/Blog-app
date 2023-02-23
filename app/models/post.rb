class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  after_save :post_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)

    private
  end

  def post_counter
    author.increment!(:post_counter)
  end
end
