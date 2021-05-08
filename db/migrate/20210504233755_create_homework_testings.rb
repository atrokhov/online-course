class CreateHomeworkTestings < ActiveRecord::Migration[6.1]
  def change
    create_table :homework_testings do |t|
      t.references :homework, null: false, foreign_key: true

      t.timestamps
    end
  end
end
