class CreateEmps < ActiveRecord::Migration
  def self.up
    create_table :emps do |t|
      t.string :name
      t.integer :extension

      t.timestamps
    end
  end

  def self.down
    drop_table :emps
  end
end
