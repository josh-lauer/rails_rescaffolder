class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.integer :isbn
      t.date :publish_date
      t.integer :author_id
      t.text :description
      t.boolean :in_stock

      t.timestamps
    end
  end
end
