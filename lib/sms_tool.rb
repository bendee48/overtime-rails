module SmsTool
  def self.send_sms(message:, number:)
    byebug
    puts 'Sending sms...'
    puts "#{message}: #{number}"
  end
end