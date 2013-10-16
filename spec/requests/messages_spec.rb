require 'spec_helper'

describe "Messages" do
  describe "GET /messages" do
  	before { visit messages_path }

    it { should have_content("Shit just got real(time)") }
    end

   describe "when replying to a message" do

   		describe "with vailid information" do
   			before do
   				fill_in "Message", with: "chat works"
   				click_button "Send message"
   			end

   			it { should_have_content("chat works") }

   		end
  end
end

