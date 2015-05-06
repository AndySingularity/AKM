class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
  before_save { email.downcase! } # => перед сохранением перевести email в нижний регистр
	VALID_USERNAME= /\A[a-zA-Zа-яА-Я\d\.\_]+\z/
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i 

	validates :username, presence: true, length: {maximum: 25}, format: {with: VALID_USERNAME,
		message: "Нудопустимые символы"}
	validates :email, presence: true, length: {maximum: 45}, format: {with:VALID_EMAIL_REGEX},
		uniqueness: { case_sensitive: false }
end
