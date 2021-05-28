class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.references :course, null: false, foreign_key: true
      t.boolean :free, default: false
      t.text :text, default: ""
      t.string :video, default: ""
      t.string :files, default: ""
      t.string :name, default: ""
      t.decimal :price, default: 0.0
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
