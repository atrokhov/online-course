class CreateClientWordHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :client_word_homeworks do |t|
      t.references :homework, null: false, foreign_key: true
      t.references :word_homework_id, null: false, foreign_key: true
      t.string :words, array: true, default: []

      t.timestamps
    end
  end
end
