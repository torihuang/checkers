class User < ActiveRecord::Base
  has_many :palaces, foreign_key: :creator_id
  has_many :rooms, through: :palaces, source: :room
  has_many :items, through: :rooms, source: :items

  validates :first_name, :last_name, :username, :email, presence: true
  validates :username, :email, uniqueness: true

  def password
    self.validate_password(self.encrypted_password)
    @password = BCrypt::Password.new(self.encrypted_password)
  end

  def password=(password_input)
    @password = BCrypt::Password.create(password_input)
    self.encrypted_password = @password
  end

  def self.authenticate(args)
    username = args[:username]
    password_input = args[:password]
    user = User.find_by(username: username)
    if user && self.password = password_input
      user
    else
      return nil
    end
  end

  private
  def validate_password(password_input)
    errors.add(:password, "must be 6 characters in length") unless password_input.length >= 6
    errors.add(:password, "must contain one number") unless /\d/.match(password_input)
    errors.add(:password, "must contain one letter") unless /\w/.match(password_input)
  end
end
