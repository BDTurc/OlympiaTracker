class AddAssociations < ActiveRecord::Migration
  def change
  	add_reference :results, :fencers, index: true
  end
end
