class List < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    title_changed?
  end 
end
