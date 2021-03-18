class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :time_logs

  def public_logs
    time_logs.includes(:groups).where.not(groups: { id: nil }).order(created_at: :desc)
  end

  def private_logs
    time_logs.includes(:groups).where(groups: { id: nil }).order(created_at: :desc)
  end
end
