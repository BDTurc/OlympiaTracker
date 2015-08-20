class AddAssociations < ActiveRecord::Migration
  def change
  	add_reference :result, :fencer, index: true
  end
end
