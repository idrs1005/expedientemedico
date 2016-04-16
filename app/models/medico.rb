class Medico < ActiveRecord::Base

  self.table_name = 'tbl_Medico'
  self.primary_key = 'ID_Medico'

  belongs_to :persona, :class_name => "Persona"

  has_many :educacion, :foreign_key => "ID_Medico", :dependent => :destroy
  has_many :experiencia, :class_name => "Experiencia", :foreign_key => "ID_Medico", :dependent => :destroy

  has_many :agenda, :class_name => "Agenda", :foreign_key => "ID_Medico", :dependent => :destroy

end
