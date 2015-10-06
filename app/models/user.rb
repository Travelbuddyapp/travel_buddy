class User < ActiveRecord::Base
  has_many :trips, dependent: :destroy
  has_many :vaccines, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_one :address, dependent: :destroy
  validates :first_name, :last_name, :birth_date, :phone_number, :gender, presence: true
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
