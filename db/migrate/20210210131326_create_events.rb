class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :hour
      t.string :adress
      t.text :description
      t.boolean :accept, default: false
      t.boolean :denied, default: false
      t.text :image_data

      t.timestamps
    end
  end
end
