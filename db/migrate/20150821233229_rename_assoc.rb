class RenameAssoc < ActiveRecord::Migration
  def change
  	rename_column :round_results, :results_id, :result_id
  end
end
