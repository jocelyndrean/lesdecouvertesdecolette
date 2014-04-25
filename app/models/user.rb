class User < ActiveRecord::Base

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  	validates :nom,  :presence => true,
                    :length   => { :maximum => 50 }
  	validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
    validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 6..40 }

    before_save :encrypt_password

  	private

    	def encrypt_password
      		self.encrypted_password = encrypt(password)
    	end

    	def encrypt(string)
      		string # Implémentation provisoire !
    	end

end
