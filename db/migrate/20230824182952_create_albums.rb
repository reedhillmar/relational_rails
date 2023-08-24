class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.boolean :ep
      t.integer :number_of_songs
      t.integer :year_released

      t.timestamps
    end
  end
end
