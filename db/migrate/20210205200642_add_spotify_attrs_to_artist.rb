class AddSpotifyAttrsToArtist < ActiveRecord::Migration[6.0]
  def change
    add_column :artists, :name, :string
    add_column :artists, :followers, :bigint
    add_column :artists, :popularity, :int
    add_column :artists, :genres, :string, array: true, default: []
    add_column :artists, :images, :string, array: true, default: []
  end
end
