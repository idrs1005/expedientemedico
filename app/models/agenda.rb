class Agenda < ActiveRecord::Base

  self.table_name = 'tbl_Agenda'
  self.primary_key = 'ID_Agenda'

  belongs_to :medico, :class_name => "Medico"

  has_many :horario, :foreign_key => "ID_Agenda", :dependent => :destroy

  has_many :admmin_agenda
  has_many :personsa, through: :admin_agenda

end
