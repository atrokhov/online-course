class CreateClientTestingHomeworks < ActiveRecord::Migration[6.1]
  def change
    create_table :client_testing_homeworks do |t|
      t.references :homework, null: false, foreign_key: true
      t.references :homework_testing_id, null: false, foreign_key: true
      t.string :answers, array: true, default: []

      t.timestamps
    end
  end
end
