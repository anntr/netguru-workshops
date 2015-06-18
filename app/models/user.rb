class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products
  #attr_accessor :firstname, :lastname, :admin #przeciez to powinno byc zbedne po dodaniu migracji, ale testy nie przechodza

  validates_presence_of :firstname, :lastname

  def admin?
    admin
  end


  def after_initialize attributes = {}
    self.firstname = attributes[:firstname]
    self.lastname = attributes[:lastname]
    self.admin = attributes[:admin]
  end


end
