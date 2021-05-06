class CreateWordHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :word_homeworks do |t|
      t.references :homework, null: false, foreign_key: true

      t.timestamps
    end
  end
end
