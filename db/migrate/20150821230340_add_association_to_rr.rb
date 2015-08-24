class AddAssociationToRr < ActiveRecord::Migration
  def change
  	add_reference :round_results, :results, index: true
  end
end
