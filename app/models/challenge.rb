class Challenge < ActiveRecord::Base
  has_many :hookups
  has_many :users, :through => :hookups

  belongs_to :completer, :class_name => "User", :foreign_key => "completed_by"
  belongs_to :starter, :class_name => "User", :foreign_key => "started_by"
  
  scope :opened, where(:complete => false).includes(:starter)
  
  # Devise
  # TODO: refactor into a named scope and a separate instance method
	def self.editable_by(user)
	  if user.is_admin
		  Challenge.all
	  else
	    Challenge.where :user_id => user.id
	  end
	  
	end
	

  def self.complete?
  	if self.complete == true
  	  return true
  	else 
  	  return false
  	end
  end
	

#App ID: 142270179193416
#App Secret: f6beeedb769017dd7c6c45dd50706c1d 
#Access Token: 142270179193416|2.AQAMuSE2pBMrQeD9.3600.1313298000.0-121146|SRkRQBnNM22oOUmz-eCtuXLPtmw

end
