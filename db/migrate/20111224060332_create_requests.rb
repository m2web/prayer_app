class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :content
      t.integer :person_id
      t.integer :category_id

      t.timestamps
    end
  end
end
