class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include User::Friendable

  has_many :pendent_invitations, class_name: 'Invitation', foreign_key: :sender_id
  has_many :inbox_invitations, class_name: 'Invitation', foreign_key: :receiver_id
  has_many :posts
end
