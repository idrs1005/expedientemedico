class Persona < ActiveRecord::Base

  self.table_name = 'tbl_Persona'
  self.primary_key = 'ID_Persona'

  validates :Nombre, presence: true, length: { maximum: 50 }
  validates :Apellido1, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :Correo, presence: true, length: { maximum: 60 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }

  has_one :medico, :foreign_key => "ID_Persona", :dependent => :destroy

  has_many :admin_agenda
  has_many :agenda, through: :admin_agenda

end
