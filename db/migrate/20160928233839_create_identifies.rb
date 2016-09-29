class CreateIdentifies < ActiveRecord::Migration[5.0]
  def change
    create_table :identifies do |t|
      t.references :users, foreign_key: true
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
