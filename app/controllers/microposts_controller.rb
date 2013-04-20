class MicropostsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:destroy]

	def create
		@micropost = current_user.microposts.build(params[:micropost])
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to(root_path)
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def destroy
		@micropost = Micropost.find(params[:id])
		@micropost.destroy
		redirect_to(root_path)	
	end

	private 
	def correct_user
		#if !current_user?(Micropost.find(params[:id]).user)
		#	flash[:notice] = "You don't have the delete authority"
		#	redirect_to(root_path)
		#end

		#This use the association between user and microposts
		@micropost = current_user.microposts.find_by_id(params[:id])
		redirect_to root_path if @micropost.nil?
	end
end
