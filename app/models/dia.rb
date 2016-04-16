class Dia < ActiveRecord::Base

  self.table_name = 'tbl_Dia'
  self.primary_key = 'ID_Dia'

  belongs_to :horario
  
end
