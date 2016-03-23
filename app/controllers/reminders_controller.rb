class RemindersController < ActionController::Base
  def new
  end

  def create
    require 'twilio-ruby'

    # put your own credentials here


    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new $account_sid, $auth_token

    @client.account.messages.create({
      :from => '+16305239409',
      :to => params[:number],
      :body => params[:message],
    })
  end
end