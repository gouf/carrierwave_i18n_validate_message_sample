class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :image

      t.timestamps null: false
    end
  end
end
