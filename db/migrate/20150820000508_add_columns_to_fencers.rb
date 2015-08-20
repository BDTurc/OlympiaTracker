class AddColumnsToFencers < ActiveRecord::Migration
  def change
    add_column :fencers, :first_name, :string
    add_column :fencers, :last_name, :string
    add_column :fencers, :club_id, :int
    add_column :fencers, :usfa_id, :string
    add_column :fencers, :fencer_id, :string
  end
end
