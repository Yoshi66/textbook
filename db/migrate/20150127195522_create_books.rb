class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :category
      t.integer :number

      t.timestamps
    end
  end
end
