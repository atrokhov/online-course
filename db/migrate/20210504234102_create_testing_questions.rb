class CreateTestingQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :testing_questions do |t|
      t.references :homework_testing, null: false, foreign_key: true
      t.text :body, default: ""
      t.string :answers, array: true, default: []
      t.string :correct_answers, array: true, default: []

      t.timestamps
    end
  end
end
