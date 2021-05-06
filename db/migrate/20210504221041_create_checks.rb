class CreateChecks < ActiveRecord::Migration[6.1]
  def change
    create_table :checks do |t|
      t.decimal :sum, default: 0.0
      t.string :customer, default: ""

      t.timestamps
    end
  end
end
