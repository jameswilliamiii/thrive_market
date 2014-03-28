class Update < ActiveRecord::Base
  after_save :send_update

  def send_update
    errors = [ ]
    PhoneNumber.verified.each do |p|
      p.send_update(self.content)
    end
  end

end
