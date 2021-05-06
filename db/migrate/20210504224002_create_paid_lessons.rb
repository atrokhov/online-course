class CreatePaidLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :paid_lessons do |t|
      t.references :check, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
  end
end
