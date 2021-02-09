class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :city
      t.string :state
      t.string :spotify_id

      t.timestamps
    end
  end
end
