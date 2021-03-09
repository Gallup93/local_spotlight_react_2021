class Album < ApplicationRecord
  validates :spotify_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :release_date, presence: true
  validates :num_tracks, presence: true
  validates :artist_id, presence: true

  belongs_to :artist
end
