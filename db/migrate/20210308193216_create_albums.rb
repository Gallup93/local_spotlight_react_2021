class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :release_date
      t.integer :num_tracks
      t.text :images, array: true, default: []
      t.string :spotify_id
      t.bigint :artist_id

      t.timestamps
    end
  end
end
