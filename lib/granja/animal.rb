module Granja
    # Clase "Animal" para representar animales
    class Animal
        include Comparable
        attr_reader :identificacion, :edad, :peso, :p_compra, :p_venta
        
        # Constructor de la clase
        # 
        # @param identificacion [String] Asigna un valor al atributo correspondiente
        # @param edad [Number] Asigna un valor al atributo correspondiente
        # @param sexo [String] Asigna un valor al atributo correspondiente
        # @param peso [Number] Asigna un valor al atributo correspondiente
        def initialize(identificacion, edad, peso, p_compra, p_venta)
            @identificacion, @edad, @peso, @p_compra, @p_venta = identificacion, edad, peso, p_compra, p_venta
            
            if defined?(@@numero_de_animales)
                @@numero_de_animales += 1
            else
                @@numero_de_animales = 1
            end
        end

        # Metodo que compara dos animales segun su peso
        # 
        # @param anOther [Animal] animal con el que sera comparado
        # @return [Boolean] Retorna true o false
        def <=>(anOther)
            @peso <=> anOther.peso
        end

        # Metodo que formatea los datos de un animal
        # 
        # @return [String] Retorna los datos formateados
        def to_s
            "Identificación: #{@identificacion}, Edad: #{@edad} días, Peso: #{@peso} gramos, Precio de compra: #{@p_compra}, Precio de venta: #{@p_venta}"
        end

        class << self
            #Metodo para reportar el numero de objetos que se instancian de la clase Animal
            def report
                @@numero_de_animales
            end
        end
    end
end
