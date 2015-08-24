class RenameKeyCol < ActiveRecord::Migration
  def change
  	rename_column :results, :fencers_id, :fencer_id
  end
end
