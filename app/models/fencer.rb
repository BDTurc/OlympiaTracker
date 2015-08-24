class Fencer < ActiveRecord::Base
	has_many :results
	has_many :round_results, through: :results


	def average_place (results)
		puts results.size
		score = 0
		total = 0
		results.each do |result|
			score += result.place
			total += 1
		end

		if total == 0 then
			return "No Results"
		end

		return score/total
	end

	def non_complete_pools (rounds)
		total = 0
		non_completes = 0
		rounds.each do |round|
			if round.score < 5 && round.opponent_score < 5 then
				non_completes += 1
			end
			total += 1
		end
	end

	def non_complete_de (rounds)
		total = 0
		non_completes = 0
		rounds.each do |round|
			if round.score < 15 && round.opponent_score < 15 then
				non_completes += 1
			end
			total += 1
		end
	end

	def biggest_upset (rounds)
		biggest_win = 0
		biggest_loss = 0
		rounds.each do |round|
			opponent_seed = round.opponent_seed
			self_seed = round.seed
			if round.victory == "V" && opponent_seed > self_seed then
				biggest_win = [biggest_win, (opponent_seed - self_seed)].max 
			elsif round.victory == "D" && opponent_seed < self_seed then
				biggest_loss = [biggest_loss, (self_seed - opponent_seed)].max
			end
		end
	end

	def total_touches (rounds)
		total_scored = 0
		total_taken = 0
		rounds.each do |round|
			total_scored += round.score
			total_taken += round.opponent_score
		end
		return [total_scored, total_taken]
	end

	def nemesis_club (rounds)
		defeats = Hash.new
		rounds.each do |round|
			if round.victory == "D" then
				if defeats.has_key? round.opponent_club_id then
					defeats[round.opponent_club_id] += 1
				else
					defeats[round.opponent_club_id] = 0
				end
			end
		end
		defeats.sort_by! {|k, v| v}
		clubs = defeats.keys
		return clubs[0]
	end

	def favored_club
		victories = Hash.new
		rounds.each do |round|
			if round.victory == "V" then
				if victories.has_key? round.opponent_club_id then
					victories[round.opponent_club_id] += 1
				else
					victories[round.opponent_club_id] = 0
				end
			end
		victories.sort_by! {|k, v| v}
		clubs = victories.keys
		return clubs[0]
		end
	end

	def win_loss (rounds)
		victories = 0.00
		losses = 0.00
		rounds.each do |round|
			if round.victory == "V" then
				victories += 1.0
			else
				losses += 1.0
			end
		end

		return victories / (victories + losses) * 100
	end

end
