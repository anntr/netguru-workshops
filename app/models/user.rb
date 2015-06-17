class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products
  attr_accessor :firstname, :lastname #przeciez to powinno byc zbedne po dodaniu migracji, ale testy nie przechodza.

  validates_presence_of :firstname, :lastname

  def initialize
    @admin = false
    super
  end

  def admin?
    @admin
  end

end
