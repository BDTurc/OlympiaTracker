require 'nokogiri'
require 'open-uri'

class GetResultsController < ApplicationController

	def update_database
		page_counter = 1
		render :nothing => true
		url = "https://api.askfred.net/v1/fencer?club_id=6859&_page=#{page_counter}&_per_page=100&_format=xml&_api_key=#{ENV["fred_api"]}"
		xml = Nokogiri::XML(open(url))

		while(xml.xpath("//fencer")).size > 0 do
			page_counter += 1
			xml.xpath("//fencer").each do |individual|
				person = Fencer.new(first_name: individual.attr("first_name"), last_name: individual.attr("last_name"), usfa_id: individual.attr("usfa_id"),
			      fencer_id: individual.attr("id"), club_id: individual.attr("primary_club_id"))
				person.save!
			end
			url = "https://api.askfred.net/v1/fencer?club_id=6859&_page=#{page_counter}&_per_page=100&_format=xml&_api_key=#{ENV["fred_api"]}"
			xml = Nokogiri::XML(open(url))
		end
	end

	def get_results

		render :nothing => true
		@fencers = Fencer.all
		@fencers.each do |fencer|
			page_counter = 1
			url = "https://api.askfred.net/v1/result?competitor_id=#{fencer.fencer_id}&_page=#{page_counter}&_per_page=100&_format=xml&_api_key=#{ENV["fred_api"]}"
			xml = Nokogiri::XML(open(url))
			while(xml.xpath("//result")).size > 0 do
				page_counter += 1
				xml.xpath("//result").each do |result|
					result = Result.new(result_id: result.attr("id"), fencers_id: fencer.id, event_id: result.attr("event_id"),
						tournament_id: result.attr("tournament_id"), tournament_name: result.attr("tournament_name"),
						entries: result.attr("entries"), event_date: result.attr("event_date"), place: result.attr("place"),
						event_rating: result.attr("event_rating"), rating_earned: result.attr("rating_Earned_letter"))
					result.save!
				end
				url = "https://api.askfred.net/v1/result?competitor_id=#{fencer.fencer_id}&_page=#{page_counter}&_per_page=100&_format=xml&_api_key=#{ENV["fred_api"]}"
				xml = Nokogiri::XML(open(url))
			end
		end
	end

	def get_round_results
		render :nothing => true
		@fencers = Fencer.all
		@fencers.each do |fencer|
			if fencer.id > 144 then
			@results = fencer.results
			@results.each do |result|
				page_counter = 1
				puts result.event_id
				if result.event_id != nil && !result.event_id.empty? && result.event_id != "57810" then
				url = "https://api.askfred.net/v1/roundresult?event_id=#{result.event_id}&_page=#{page_counter}&_per_page=100&_format=xml&_api_key=#{ENV["fred_api"]}"
				xml = Nokogiri::XML(open(url))
					xml.xpath("//bout").each do |bout|
						bout_fencers = bout.xpath("fencers/fencer")
						if bout_fencers.count > 1 then

							fencer_one = bout_fencers[0]
							fencer_two = bout_fencers[1]
							
							if fencer_one.attr("id") == fencer.fencer_id then
								puts fencer.first_name
								round_result = RoundResult.new(opponent_id: fencer_two.attr("id"),
									fencer_id: fencer_one.attr("id"), club_id: fencer_one.attr("primary_club_id"), opponent_first: fencer_two.attr("first_name"),
									opponent_last: fencer_two.attr("last_name"), opponent_club_id: fencer_two.attr("primary_club_id"),
									victory: fencer_one.attr("status"), opponent_score: fencer_two.attr("score"), opponent_seed: fencer_two.attr("seed"), 
									score: fencer_one.attr("score"), seed: fencer_one.attr("seed"),
									round_type: bout.parent.parent.parent.parent.attr("round_type"), tournament_id: result.tournament_id, result_id: result.id, event_id: result.event_id)
								round_result.save!
							elsif fencer_two.attr("id") == fencer.fencer_id then
								puts fencer.first_name
								round_result = RoundResult.new(opponent_id: fencer_one.attr("id"),
									fencer_id: fencer_two.attr("id"), club_id: fencer_two.attr("primary_club_id"), opponent_first: fencer_one.attr("first_name"),
									opponent_last: fencer_one.attr("last_name"), opponent_club_id: fencer_one.attr("primary_club_id"),
									victory: fencer_two.attr("status"), opponent_score: fencer_one.attr("score"), opponent_seed: fencer_one.attr("seed"),
									score: fencer_two.attr("score"), seed: fencer_two.attr("seed"),
									round_type: bout.parent.parent.parent.parent.attr("round_type"), tournament_id: result.tournament_id, result_id: result.id, event_id: result.event_id)
								round_result.save!
							end
						end
					end
			end
		end
			end
		end
	end
end