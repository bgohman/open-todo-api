class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user
  validates :body, presence: true
end
