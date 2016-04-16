class RegistroController < ApplicationController
  def index
    @persona = Persona.new
    @medico = Medico.new
  end

  def medico_create
    Persona.transaction do
      @persona = Persona.new
        @persona.Nombre = nombre
        @persona.Apellido1 = apellido1
        @persona.Apellido2 = apellido2
        @persona.Identificacion = identificacion
        @persona.Correo = correo
        @persona.Usuario = usuario
        @persona.password = contrasena
        @persona.password_confirmation = confirmacion
        # Tipo 1 = Paciente, 2 = Asistente, 3 = Medico, 4 = Admin C. Medicos
        @persona.Tipo = 3
      if @persona.save
          #CREACION DE LA ENTIDAD MEDICO
          @medico = Medico.new
            @medico.ID_Persona = @persona.ID_Persona
            @medico.Codigo_Licencia = codigoLicencia
            @medico.Validado = 0
          if @medico.save
            #CREACION DE LA VALIDACION
            @validacion = Validacion.new
              @validacion.ID_Persona = @persona.ID_Persona
              @validacion.Codigo_Validacion = generar_validacion
            if @validacion.save
              redirect_to registro_exito_path
            else
              redirect_to registro_error_path
            end # End validacion.save
          else
            redirect_to registro_error_path
          end # End medico.save
      else
        redirect_to registro_error_path
      end # End persona.save
    end # End transaction
  end # End medico_create

private

  def fecha_nacimiento
    Date.new(params[:registro][:persona][:fecha_nacimiento])
  end

  def nombre
    params[:registro][:Nombre]
  end

  def apellido1
    params[:registro][:Apellido1]
  end

  def apellido2
    params[:registro][:Apellido2]
  end

  def identificacion
    params[:registro][:Identificacion]
  end

  def correo
    params[:registro][:Correo]
  end

  def usuario
    params[:registro][:Usuario]
  end

  def contrasena
    params[:registro][:Contrasena]
  end

  def confirmacion
    params[:registro][:CContrasena]
  end

  def codigoLicencia
    params[:registro][:CodigoLicencia]
  end

end
