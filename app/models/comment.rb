class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :comments_count

  private

  def comments_count
    post.increment!(:comments_counter)
  end
end
