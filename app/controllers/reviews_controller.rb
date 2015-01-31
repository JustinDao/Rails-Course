class ReviewsController < ApplicationController

	def new
		@review = Review.new
		@courses = Course.all.map{|c| [c.title, c.id] }
	end

	def create
		@review = Review.new
		@review.rating = params[:review][:rating]
		@review.comment = params[:review][:comment]
		@review.course_id = params[:review][:course_id]

		if @review.save
			redirect_to "/courses/#{@review.course_id}"
		else
			redirect_to "/reviews/new"
		end
	end
end
