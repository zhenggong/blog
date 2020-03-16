class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.text :name
      t.references :user, foreign_key: true
      t.text :detail
      t.string :icon
      t.string :image

      t.timestamps
    end
  end
end
