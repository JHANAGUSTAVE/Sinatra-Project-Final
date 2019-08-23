class User < ActiveRecord::Base
    validates_presence_of :username, :email, :password
    validates :username, :uniqueness => {:case_sensitive => false}
    has_secure_password
    has_many :galeries

    # before_save { |user| user.email = email.downcase }

    
  
    def self.find_by_slug(slug)
      self.all.find{ |user| user.slug == slug }
    end
    def slug
      self.username.gsub(" ", "-").downcase
    end
  end
  