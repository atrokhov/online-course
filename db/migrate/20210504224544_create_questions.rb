class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :lesson, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body, default: ""
      t.string :name, default: ""

      t.timestamps
    end
  end
end
