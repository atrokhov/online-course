class CreateChatVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :chat_visits do |t|
      t.references :chat, null: false, foreign_key: true
      t.datetime :last_visit, default: DateTime.now

      t.timestamps
    end
  end
end
