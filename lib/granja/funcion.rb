module Granja
    # Modulo "Funcion" para representar las funciones de una Granja
    module Funcion
        # Constante para representar las condiciones de vida
        CONDICIONES_DE_VIDA = "Campo Abierto"
        @@condiciones = CONDICIONES_DE_VIDA
        @@cuidados = ''
        @@reproduccion = []

        # Procedimiento para establecer los cuidados de los animales
        # 
        # @param value [String] Nuevo valor
        # @return [String] Retorna el valor que ha sido cambiado
        def definirCuidados (value)
            @@cuidados = value
        end

        # Procedimiento para obtener los cuidados de los animales
        # 
        # @return [String] Retorna los cuidados
        def cuidados
            @@cuidados
        end

        # Procedimiento para establecer la reproduccion de los animales
        # 
        # @param value [String] Nuevo valor
        # @return [String] Retorna el valor que ha sido cambiado
        def definirReproduccion (value)
            @@reproduccion = value
        end

        # Procedimiento para obtener la reproduccion de los animales
        # 
        # @return [String] Retorna la reproduccion
        def reproduccion
            @@reproduccion
        end   
        
        # Procedimiento para establecer las condiciones de vida de una granja
        # 
        # @param value [String] Nuevo valor
        # @return [String] Retorna el valor que ha sido cambiado
        def definirCondiciones_de_vida (value)
            @@condiciones = value
        end
        
        # Procedimiento para obtener las condiciones de vida
        # 
        # @return [String] Retorna las condiciones de vida
        def condiciones_de_vida
            @@condiciones
        end

        # Funcion para calcular el bienestar animal de una granja
        # (Programacion Funcional)
        # @param granja [Object] Granja
        # @param condicion_de_vida [String] Condiciones de vida
        def self.bienestar_animal(granja, condicion_de_vida)
            ratio = granja.ejemplares.collect{|a| a.peso/a.edad}
            my_if condicion_de_vida == "campo",
                -> {ratio.max},
                -> {ratio.max / 2}
        end

        # Funcion para calcular el beneficio neto de una granja
        # (Programacion Funcional)
        # @param granja [Object] Granja
        def self.beneficio_neto(granja)
            peso = granja.ejemplares.collect{|a| a.peso}
            edad = granja.ejemplares.collect{|a| a.edad}
            p_venta = granja.ejemplares.collect{|a| a.p_venta}
            avg_peso = peso.reduce(:+) / peso.size
            avg_edad = edad.reduce(:+) / edad.size
            avg_p_venta = p_venta.reduce(:+) / p_venta.size      
            my_if avg_peso <= avg_edad,
                -> {avg_p_venta / avg_peso},
                -> {avg_p_venta / avg_edad}
        end

        # Funcion para calcular el indice de productividad de una granja
        # (Programacion Funcional)
        # @param granja [Object] Granja
        # @param condicion_de_vida [String] Condiciones de vida
        def self.indice_productividad(granja, condicion_de_vida)
            productividad = 0
            bienestar = bienestar_animal(granja, condicion_de_vida)
            beneficio = beneficio_neto(granja)
            my_if bienestar <= 20 && beneficio < 10,
                -> {productividad = 1},
                -> {my_if bienestar >= 80 && beneficio > 50,
                    -> {productividad = 3},
                    -> {productividad = 2}}
            productividad
        end

        # Funcion para calcular la granja con maxima productividad de una cooperativa
        # (Programacion Funcional)
        # @param granja [Array] Granjas
        def self.maxima_productividad(granjas)
            productividades = granjas.collect{|a| {"productividad" => indice_productividad(a, a.condiciones_de_vida), "granja" => a}}
            productividades.sort{|a, b| b.max<=>a.max}[0]['granja']    
        end

        # Funcion para incrementar el precio de venta de las granjas de una cooperativa
        # (Programacion Funcional)
        # @param granja [Array] Granjas
        def self.incrementar_p_venta(granjas)
            precio_granja_maxima_produc = maxima_productividad(granjas).p_venta
            granjas.collect{|g| my_if g.p_venta != precio_granja_maxima_produc,
                -> {my_if g.p_venta < precio_granja_maxima_produc,
                    -> {g.p_venta = g.p_venta + ((precio_granja_maxima_produc - g.p_venta)/2)},
                    -> {g.p_venta = g.p_venta}},
                -> {g.p_venta = g.p_venta}
            g}
        end

        # Funcion auxiliar para la programacion funcional (if)
        # 
        # @param condition
        # @param then_clause
        # @param else_clause
        def self.my_if(condition, then_clause, else_clause)
            if condition
              then_clause.call
            else
              else_clause.call
            end
        end
    end
    include Funcion
end
