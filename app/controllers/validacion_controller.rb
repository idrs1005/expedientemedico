class ValidacionController < ApplicationController

  def index
    usuario = params[:usuario]
    codigo = params[:codigo]
    @persona = encuentra_persona usuario
    @validacion = encuentra_validacion @persona.ID_Persona
    if @persona.Validado != 1 && codigo == @validacion.Codigo_Validacion
      begin
        Persona.transaction do
          @persona.update_attribute(:Validado, 1)
        end
      redirect_to validacion_exito_path
      rescue Exception => ex
        redirect_to validacion_error_path
      end
    else
      redirect_to validacion_error_path
    end # End codigos iguales
  end

end
