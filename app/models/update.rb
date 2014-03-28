class Update < ActiveRecord::Base
  after_save :check_for_send_immediately

  def check_for_send_immediately
    self.send_update if self.send_immediately
  end

  def send_update
    PhoneNumber.verified.each{ |p| p.send_update }
  end

end
