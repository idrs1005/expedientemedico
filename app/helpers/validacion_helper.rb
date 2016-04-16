module ValidacionHelper

  def encuentra_persona(usuario)
    @persona ||= Persona.where("Usuario = :input", {input: usuario}).first
  end

  def encuentra_validacion(id)
    @validacion ||= Validacion.find_by(ID_Persona: id)
  end

end
