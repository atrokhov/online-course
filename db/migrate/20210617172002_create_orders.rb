class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :lesson, null: false, foreign_key: true
      t.belongs_to :basket, null: false, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
