class Experiencia < ActiveRecord::Base

  self.table_name = 'tbl_Experiencia'
  self.primary_key = 'ID_Experiencia'

  belongs_to :medico, :class_name => "Medico"

end
