class Result < ActiveRecord::Base
	belongs_to :fencer
	has_many :round_results

end
