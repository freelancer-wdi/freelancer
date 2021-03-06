class Programmer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :portfolio, :dependent => :destroy
  before_create :build_portfolio
  accepts_nested_attributes_for :portfolio

  has_many :offers
  has_many :projects, through: :offers
end
