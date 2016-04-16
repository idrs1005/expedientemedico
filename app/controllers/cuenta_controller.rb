class CuentaController < ApplicationController

  def index
    flash[:danger] = ''
    if logged_in?
      redirect_to cuenta_perfil_path
    else
      @persona = Persona.new
    end
  end


  def login
    if logged_in?
      redirect_to cuenta_perfil_path
    else
      @persona = encuentra_persona usuario
      if !@persona.nil?
        if @persona.Validado == 1
          if @persona.authenticate(contrasena)
            log_in @persona
            redirect_to cuenta_perfil_path
          else
            flash[:danger] = 'Contraseña invalida'
            render 'index'
          end # End autenticacion
        else
          flash[:danger] = 'Debe confirmar su email para iniciar sesion'
          render 'index'
        end # End validado
      else
        flash[:danger] = 'El usuario indicado no existe'
        render 'index'
      end # End usuario existente
    end # End logged_in?
  end

  def logout
    if logged_in?
      log_out
      redirect_to cuenta_path
    else
      redirect_to cuenta_path
    end
  end

  def perfil
    @persona = current_user
    @medico = encuentra_medico
  end

  def educacion
    @medico = encuentra_medico
    @educacion_temp = Educacion.new
      @educacion_temp.Titulo_Obtenido = titulo
      @educacion_temp.ID_Medico = @medico.ID_Medico
    if @educacion_temp.save
      redirect_to cuenta_perfil_path
    else
      redirect_to cuenta_perfil_path
    end
  end

  def edit_edu
    @educacion = Educacion.find_by(ID_Educacion: tempID)
    @persona = current_user
    @medico = encuentra_medico
    if @educacion != nil
      if @educacion.ID_Medico == @medico.ID_Medico
        Educacion.transaction do
          @educacion.update_attribute(:Titulo_Obtenido, tituloedit)
        end
        render 'perfil'
      else
        render 'perfil'
      end
    else
      render 'perfil'
    end
  end

  def del_edu
    @educacion = Educacion.find_by(ID_Educacion: tempID)
    if @educacion != nil
      @medico = encuentra_medico
      if @educacion.ID_Medico == @medico.ID_Medico
        @educacion.destroy
        redirect_to cuenta_perfil_path
      else
        redirect_to cuenta_perfil_path
      end
    else
      redirect_to cuenta_perfil_path
    end
  end

  def experience
    @medico = encuentra_medico
    @experiencia_temp = Experiencia.new
      @experiencia_temp.Experiencia = experiencia
      @experiencia_temp.ID_Medico = @medico.ID_Medico
    if @experiencia_temp.save
      redirect_to cuenta_perfil_path
    end
  end

  def edit_exp
    @experiencia = Experiencia.find_by(ID_Experiencia: tempID)
    @persona = current_user
    @medico = encuentra_medico
    if @experiencia != nil
      if @experiencia.ID_Medico == @medico.ID_Medico
        Experiencia.transaction do
          @experiencia.update_attribute(:Experiencia, experienciaedit)
        end
        render 'perfil'
      else
        render 'perfil'
      end
    else
      render 'perfil'
    end
  end

  def agendas
    @medico = encuentra_medico
    @agenda = Agenda.new
      @agenda.Nombre = params[:cuenta][:Nombre]
      @agenda.ID_Medico = @medico.ID_Medico
    if @agenda.save
      redirect_to cuenta_perfil_path
    end
  end

  def edit_agenda
    @agenda = Agenda.find_by(ID_Agenda: tempID)
    @persona = current_user
    @medico = encuentra_medico
    if @agenda != nil
      if @agenda.ID_Medico == @medico.ID_Medico
        Agenda.transaction do
          @agenda.update_attribute(:Nombre, agendaedit)
        end
        render 'perfil'
      else
        render 'perfil'
      end
    else
      render 'perfil'
    end
  end


  def horario
    @persona = current_user
    @medico = encuentra_medico
    @agenda = Agenda.find_by(ID_Medico: @medico.ID_Medico, Nombre: agenda_horario)
    horario_agenda @agenda
    if @horario == nil
      @horario = Horario.new
    end
  end

  def agrega_horario
    if params[:finalizar]
      cerrar_agenda
      redirect_to cuenta_perfil_path and return
    end
    @agenda = agenda_actual
    @agendas = Agenda.where("ID_Medico = ?", @agenda.ID_Medico).to_a
    @horario = Horario.new
      @horario.ID_Agenda = @agenda.ID_Agenda
      @horario.ID_Dia = params[:cuenta][:dia]
      @horario.Hora_Inicio = params[:cuenta][:horaInicio]
      @horario.Hora_Final = params[:cuenta][:horaFinal]
    if @horario.Hora_Final > @horario.Hora_Inicio
      @agendas.each do |agen|
        agen.horario.each do |hor|
            if hor.ID_Dia == @horario.ID_Dia && ( (@horario.Hora_Inicio.between?(hor.Hora_Inicio, hor.Hora_Final)) || (@horario.Hora_Final.between?(hor.Hora_Inicio, hor.Hora_Final)) || (hor.Hora_Inicio.between?(@horario.Hora_Inicio, @horario.Hora_Final)) || (hor.Hora_Final.between?(@horario.Hora_Inicio, @horario.Hora_Final)) )
              flash[:danger] = 'El horario ' + Dia.find_by(ID_Dia: hor.ID_Dia).Dia + ' de ' + @horario.Hora_Inicio.strftime("%I:%M%p")  + ' a ' + @horario.Hora_Final.strftime("%I:%M%p")  + ' choca con otro horario creado en ' + agen.Nombre
              render 'horario' and return
            end # Validacion de choque de horario
        end # end for de horarios
      end # end for de agendas
      if @horario.save
        flash[:danger] = ''
        redirect_to cuenta_horario_path(:agenda => @agenda.Nombre)
      end # @horario.save
    else
      flash[:danger] = 'La hora inicial debe ser menor a la final'
      render 'horario'
    end # Validacion que la hora final sea mayor q la inicial
  end



private

    def tempID
      params[:format]
    end

    def usuario
      params[:cuenta][:Usuario]
    end

    def contrasena
      params[:cuenta][:Contrasena]
    end

    def titulo
      params[:cuenta][:Titulo]
    end

    def experiencia
      params[:cuenta][:Experiencia]
    end

    def tituloedit
      params[:educacion][:Titulo_Obtenido]
    end

    def experienciaedit
      params[:experiencia][:Experiencia]
    end

    def agenda
      params[:cuenta][:Nombre]
    end

    def agendaedit
      params[:agenda][:Nombre]
    end

    def agenda_horario
      params[:agenda]
    end

end
