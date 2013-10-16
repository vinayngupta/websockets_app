class MessagesController < ApplicationController

	def index
		@messages = Message.all
		@message = Message.new
	end

	def new
		@message = Message.new
	end

	def create
		@message = Message.create(params[:message].permit(:name, :message))
		WebsocketRails[:messages].trigger 'yo', @message
		
		#example unobtrusive javascript 
		# respond_to do |format|
		# 	@message.save
		# 	format.html { redirect_to @message, notice:"Good job"}
		# 	format.js { }
		# 	format.json { render json: @message, status: :created, location: @message }
		# end
		
		redirect_to messages_path #Message 
	end


	def show
		@message = Message.find(params[:id])
	end

end



