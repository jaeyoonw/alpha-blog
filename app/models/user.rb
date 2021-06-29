class User < ApplicationRecord
  before_save { self.email = email.downcase } # 데이터베이스에 저장하기전에, 객체의 상태를 변경한다. 
  has_many :articles, dependent: :destroy
  validates :username, presence: true, 
                       uniqueness: { case_sensitive: false }, 
                       length: { minimum: 3, maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i                       
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX } # 이메일의 형식인지 유효성 검사 
  has_secure_password                    
end  