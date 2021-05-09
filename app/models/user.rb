class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_superuser?
  	!Superuser.where(user: self).blank? ? true : false
  end

  def is_admin?
  	!Admin.where(user: self).blank? ? true : false
  end

  def is_client?
  	!Client.where(user: self).blank? ? true : false
  end

  def is_manager?
  	!Manager.where(user: self).blank? ? true : false
  end
end
