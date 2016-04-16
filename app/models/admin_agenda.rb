class AdminAgenda < ActiveRecord::Base

  self.table_name = 'tbl_AdministradorAgenda'
  self.primary_key = 'ID_AdministradorAgenda'

  belongs_to :persona, :class_name => "Persona"
  belongs_to :agenda, :class_name => "Agenda"


end
