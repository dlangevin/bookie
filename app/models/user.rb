class User < ActiveRecord::Base

  has_many :hookups
  has_many :challenges, :through => :hookups
  
  has_many :started_challenges, 
    :class_name => "Challenge", :foreign_key => "started_by"  
  
  def self.is_admin?
    if self.is_admin == true
		return true
	else
		return false
	end	
  end
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
end
