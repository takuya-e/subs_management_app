class Post < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subscription, optional: true
  has_many :likes, dependent: :destroy

  validates :content, presence: true

end
