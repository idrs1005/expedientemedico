module CuentaHelper

  def log_in(persona)
    session[:user_id] = persona.ID_Persona
  end

  def current_user
    @current_user ||= Persona.find_by(ID_Persona: session[:user_id])
  end

  def encuentra_persona(usuario)
    @persona ||= Persona.where("Usuario = :input OR Correo = :input", {input: usuario}).first
  end

  def encuentra_medico
    @medico ||= current_user.medico
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session[:user_id] = nil
    current_user = nil
  end

  def horario_agenda(agenda)
    session[:agenda_id] = agenda.ID_Agenda
  end

  def cerrar_agenda
    session[:agenda_id] = nil
  end

  def agenda_actual
    @agenda ||= Agenda.find_by(ID_Agenda: session[:agenda_id])
  end

end
