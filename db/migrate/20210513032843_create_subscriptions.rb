class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true, index: true, unique: true
      t.string :email, index: true, unique: true
      t.timestamps
    end
  end
end
