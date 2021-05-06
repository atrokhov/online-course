class CreateDoneHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :done_homeworks do |t|
      t.references :teacher, null: false, foreign_key: true
      t.references :homework, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
