module SmsTool
  account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
  auth_token = Rails.application.credentials.dig(:twilio, :auth_token)

  @client = Twilio::REST::Client.new account_sid, auth_token

  def self.send_sms(message:, number:)
    puts 'Sending sms...'
    @client.messages.create(
      from: Rails.application.credentials.dig(:twilio, :trial_number),
      to: "+44#{number[1..-1]}",
      body: "#{message}"
    )
  end
end