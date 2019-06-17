class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.string :img_url
      t.integer :autor_id

      t.timestamps
    end
  end
end
