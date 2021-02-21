class Favorite < ApplicationRecord
  validates_presence_of :user_id
  validates_presence_of :artist_id
  belongs_to :user
  belongs_to :artist
end
