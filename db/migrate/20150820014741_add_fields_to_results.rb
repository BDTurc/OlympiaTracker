class AddFieldsToResults < ActiveRecord::Migration
  def change
    add_column :results, :result_id, :string
    add_column :results, :event_id, :string
    add_column :results, :tournament_id, :string
    add_column :results, :tournament_name, :string
    add_column :results, :entries, :int
    add_column :results, :event_date, :string
    add_column :results, :place, :int
    add_column :results, :rating_earned, :string
  end
end
