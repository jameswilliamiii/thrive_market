class Update < ActiveRecord::Base
  after_save :send_update

  def send_update
    PhoneNumber.verified.each{ |p| p.send_update(self.content) }
  end

end
