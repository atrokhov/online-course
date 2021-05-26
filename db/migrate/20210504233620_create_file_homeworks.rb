class CreateFileHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :file_homeworks do |t|
      t.references :homework, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :files, default: ""

      t.timestamps
    end
  end
end
