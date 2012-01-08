class CreateWestminsterCatechismQandAs < ActiveRecord::Migration
  def change
    create_table :westminster_catechism_qand_as do |t|
      t.integer :questionnumber
      t.text :question
      t.text :answer

      t.timestamps
    end
  end
end
