class CreateTextOfWordHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :text_of_word_homeworks do |t|
      t.references :word_homework, null: false, foreign_key: true
      t.text :text, default: ""
      t.string :code_lang, null: true, default: "common text"
      t.integer :positions_of_words, array: true, default: []
      t.string :title, default: ""

      t.timestamps
    end
  end
end
