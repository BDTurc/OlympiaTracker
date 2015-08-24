class RemoveTableRr < ActiveRecord::Migration
  def change
  	drop_table :round_results
  end
end
