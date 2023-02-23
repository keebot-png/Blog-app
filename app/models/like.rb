class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :likes_count

  private

  def likes_count
    post.increment!(:likes_counter)
  end
end
