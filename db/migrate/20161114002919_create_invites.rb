class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :id_bet
      t.integer :id_user

      t.timestamps null: false
    end
  end
end
