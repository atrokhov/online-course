class CreateHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworks do |t|
      t.references :lesson, null: false, foreign_key: true
      t.text :text, default: ""
      t.timestamp :time_to_complete, default: DateTime.now
      t.string :type, default: "common"
      t.string :category_of_work, default: "testing"
      t.boolean :has_score, default: false

      t.timestamps
    end
  end
end
