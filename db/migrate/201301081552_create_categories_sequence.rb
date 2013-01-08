class CreateCategoriesSequence < ActiveRecord::Migration
  def up
    #create sequence
    execute <<-SQL
	CREATE SEQUENCE categories_id_seq
	INCREMENT 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 25
	CACHE 1;
    SQL
  end
 
  def down
	DROP SEQUENCE categories_id_seq;
  end
end
