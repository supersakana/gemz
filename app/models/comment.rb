class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :reactions, as: :reactable, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  def message
    'commented on your post'
  end
end
