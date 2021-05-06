class CreateTestsForCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_for_codes do |t|
      t.references :homework, null: false, foreign_key: true
      t.string :tests, default: ""

      t.timestamps
    end
  end
end
