class Artist < ApplicationRecord
  validates :spotify_id, presence: true, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true
  validates :name, presence: true
  validates :followers, presence: true
  validates :popularity, presence: true
end
