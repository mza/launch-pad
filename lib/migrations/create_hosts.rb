class CreateHosts < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.string :title
    end
  end

  def self.down
    drop_table :title
  end
end