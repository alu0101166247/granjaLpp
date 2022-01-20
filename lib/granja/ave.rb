module Granja
    # Clase "Ave" para representar aves
    class Ave < Animal
        include Comparable
        attr_reader :t_pico, :t_patas, :t_movilidad

        # Constructor de la clase
        # 
        # @param t_pico [String] Asigna un valor al atributo correspondiente
        # @param t_patas [String] Asigna un valor al atributo correspondiente
        # @param t_movilidad [String] Asigna un valor al atributo correspondiente
        def initialize(identificacion, edad, sexo, peso, t_pico, t_patas, t_movilidad)
            super(identificacion, edad, sexo, peso)
            @t_pico, @t_patas, @t_movilidad = t_pico, t_patas, t_movilidad
        end

        # Metodo que compara dos aves segun su edad
        # 
        # @param anOther [Ave] ave con el que sera comparado
        # @return [Boolean] Retorna true o false
        def <=>(anOther)
            @edad <=> anOther.edad
        end

        # Metodo que formatea los datos de un ave
        # 
        # @return [String] Retorna los datos formateados
        def to_s
            super + ", Tipo de pico: #{@t_pico}, Tipo de patas: #{@t_patas}, Tipo de movilidad: #{@t_movilidad}"
        end
    end
end
