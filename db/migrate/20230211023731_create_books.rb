class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.text :body

      t.timestamps
    end
  end
end

class AddImageToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :image, :string
  end
end