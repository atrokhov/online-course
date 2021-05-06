class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :question, null: true, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :body, default: ""

      t.timestamps
    end
  end
end
