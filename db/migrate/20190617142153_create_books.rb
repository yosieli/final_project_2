class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.string :img_url
      t.string :author
      t.integer :page_count
      t.text :summary
      t.timestamps
    end
  end
end
