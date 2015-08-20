class CreateFencers < ActiveRecord::Migration
  def change
    create_table :fencers do |t|

      t.timestamps
    end
  end
end
