class Educacion < ActiveRecord::Base

  self.table_name = 'tbl_Educacion'
  self.primary_key = 'ID_Educacion'

  validates :Titulo_Obtenido, presence: true, length: { maximum: 150 }

  belongs_to :medico, :class_name => "Medico"

end
