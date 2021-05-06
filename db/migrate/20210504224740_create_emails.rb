class CreateEmails < ActiveRecord::Migration[6.1]
  def change
    create_table :emails do |t|
      t.references :manager, null: false, foreign_key: true
      t.string :name, default: ""
      t.text :body, default: ""

      t.timestamps
    end
  end
end
