class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.text :description, default: ""

      t.timestamps
    end
  end
end
