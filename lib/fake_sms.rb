module FakeSms
  Message = Struct.new(:message, :number)
  @messages = []

  def self.send_sms(message:, number:)
    @messages << Message.new(message, number)
  end

  def self.messages
    @messages
  end
end