class CreateCources < ActiveRecord::Migration[6.1]
  def change
    create_table :cources do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
