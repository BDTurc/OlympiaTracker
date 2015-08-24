class AddEventRatingToResults < ActiveRecord::Migration
  def change
    add_column :results, :event_rating, :string
  end
end
