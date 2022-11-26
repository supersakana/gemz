class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactable, polymorphic: true
  has_many :notifications, as: :notifiable, dependent: :destroy

  validates :user_id, uniqueness: { scope: %i[reactable_id reactable_type category] }

  def message
    "liked your post: #{reactable.content.truncate(50)}"
  end
end
