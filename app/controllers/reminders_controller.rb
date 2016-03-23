class RemindersController < ActionController::Base
  def new
  end

  def create
    require 'twilio-ruby'

    # put your own credentials here
    account_sid = 'AC99298024076004c694117fed9f33c42b'
    auth_token = '8bbfc3cf65a00a3f00bfa55852324621'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      :from => '+16305239409',
      :to => params[:number],
      :body => params[:message],
    })
  end
end