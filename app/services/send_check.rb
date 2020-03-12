class SendCheck
  attr_reader :check

  def self.call(*args)
    new(*args).call
  end

  def initialize(check)
    @check = check
  end

  def call
    check.with_lock do
      return if check.sent_at
      send_check!
      check.mark_as_sent!
    end
  end

  # call to check-printing API goes here
  def send_check!
    :success
  end

  class FailedSend < StandardError; end
end
