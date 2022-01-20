module Granja
    # Clase "Avicola" para representar aves de corral
    class Avicola < Datos
        include Granja
        include Enumerable

        attr_reader :t_aves, :destino_animales, :n_aves, :p_compra, :p_venta, :aves
        attr_writer :p_venta

        # Constructor de la clase
        # 
        # @param t_aves [String] Asigna un valor al atributo correspondiente
        # @param destino_animales [String] Asigna un valor al atributo correspondiente
        # @param n_aves [Number] Asigna un valor al atributo correspondiente
        # @param p_compra [Number] Asigna un valor al atributo correspondiente
        # @param p_venta [Number] Asigna un valor al atributo correspondiente
        # @param aves [Array] Asigna un valor al atributo correspondiente
        def initialize(identificacion, nombre, tipo, descripcion, t_aves, destino_animales, n_aves, p_compra, p_venta, aves, condiciones)
            super(identificacion, nombre, tipo, descripcion)
            @t_aves, @destino_animales, @n_aves, @p_compra, @p_venta, @aves = t_aves, destino_animales, n_aves, p_compra, p_venta, aves
            @@condiciones = condiciones
        end

        # Metodo que formatea los datos de una granja avicola
        # 
        # @return [String] Retorna los datos formateados
        def to_s
            super + ", Tipo de aves: #{@t_aves}, Destino de los animales: #{@destino_animales}, Nro de aves en la granja: #{@n_aves}, Precio unitario: #{@p_compra}, Precio de venta unitario: #{@p_venta}, Aves de la granja: #{@aves.map{|a| a.identificacion}}, Condiciones de vida: #{@@condiciones}"
        end

        # Metodo que selecciona las aves que se pueden reproducir
        #
        def definirReproduccion
            @@reproduccion = @aves.select{|a| a.edad > 24*30}
        end

        # each para Enumerable
        #
        def each
            yield @n_aves
            yield @p_compra
            yield @p_venta
        end
    end
end
