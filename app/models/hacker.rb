# == Schema Information
#
# Table name: hackers
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  authentication_token   :string(255)
#

class Hacker < ActiveRecord::Base
  has_one :resume

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :name, :email, :authentification_token

  def revoke_authentication_token
    self.authentication_token = nil
  end

  before_save :ensure_authentification_token

  def ensure_authentification_token
    self.authentication_token ||= generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless Hacker.where(authentication_token: token).first
    end
  end
end
