class CreateArtist < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :year_formed
      t.boolean :touring

      t.timestamps
    end
  end
end
