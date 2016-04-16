module RegistroHelper

  def generar_validacion(length = 48) # El largo final es 4/3 de length
    begin
      codigo = SecureRandom.urlsafe_base64 length
    end while Validacion.exists?(:Codigo_Validacion => codigo)
    @codigo_val ||= codigo
  end

end
