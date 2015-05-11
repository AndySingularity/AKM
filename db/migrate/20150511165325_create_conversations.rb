class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title
      t.belongs_to :forum, index: true
      t.timestamps
    end
  end
end
