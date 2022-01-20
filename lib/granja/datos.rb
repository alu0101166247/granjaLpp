module Granja
    # Clase "Datos" para representar los datos de una Granja
    class Datos
        attr_reader :identificacion, :nombre, :tipo, :descripcion

        # Constructor de la clase
        # 
        # @param identificacion [String] Asigna un valor al atributo correspondiente
        # @param nombre [String] Asigna un valor al atributo correspondiente
        # @param tipo [String] Asigna un valor al atributo correspondiente
        # @param descripcion [String] Asigna un valor al atributo correspondiente
        def initialize(identificacion, nombre, tipo, descripcion)
            @identificacion, @nombre, @tipo, @descripcion = identificacion, nombre, tipo, descripcion
        end

        # Metodo que formatea los datos de una granja
        # 
        # @return [String] Retorna los datos formateados
        def to_s
            "Identificacion: #{@identificacion}, Nombre: #{@nombre}, Tipo: #{@tipo}, Descripcion: #{@descripcion}"
        end
    end
end
