class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :title, presence: true
  type_regex = /\A(?:(open)|(viewable)|(private))\Z/
  validates :permissions, presence: true, format: { with: type_regex }
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end 
end
