class API::StatusController < ApplicationController
	def update 
		@status = Status.find_by_site(params[:site])
		
	end

end