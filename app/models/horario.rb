class Horario < ActiveRecord::Base

  self.table_name = 'tbl_Horario'
  self.primary_key = 'ID_Horario'

  belongs_to :medico, :class_name => "Agenda"

  has_one :dia, :class_name => "Dia", :foreign_key => "ID_Dia", :dependent => :destroy

end
