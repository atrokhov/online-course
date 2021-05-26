class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :name, default: ""
      t.text :description, default: ""
      t.references :category, null: false, foreign_key: true
      t.references :teacher, null: true, foreign_key: { to_table: :users }
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
