class Subscription < ApplicationRecord
  has_many :posts
  has_many :user_contracts
end
