class CreateBaskets < ActiveRecord::Migration[6.1]
  def change
    create_table :baskets do |t|
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
