class CreateNodes < ActiveRecord::Migration
  def self.up
    create_table :nodes do |t|
      t.string :name
      t.string :role
      t.timestamps
    end
  end

  def self.down
    drop_table :hosts
  end
end