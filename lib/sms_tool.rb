module SmsTool
  def self.send_sms(message:, number:)
    puts 'Sending sms...'
    puts "#{message}: #{number}"
  end
end