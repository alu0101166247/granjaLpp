module Granja
	# Clase "DSLGranja"
   	class DSLGranja
		attr_reader :identificacion, :datos, :ejemplares

		# Constructor de la clase
        # 
        # @param identificacion [String]
        # @param &block [block]
   	    def initialize(identificacion, &block)
   	        @identificacion = identificacion
   	        @datos
   	        @ejemplares = []
            
   	        if block_given?  
   	          if block.arity == 1
   	            yield self
   	          else
   	            instance_eval(&block) 
   	          end
   	        end
   	    end
   	
		# Metodo que formatea los datos de una granja
        # 
        # @return [String] Retorna los datos formateados
   	    def to_s
   	        output = "DSLGranja: #{@datos.to_s}\n\n"
            
   	        @ejemplares.each_with_index do |ejemplar, index|
   	          output << "#{index + 1}) #{ejemplar.to_s}\n"
   	        end
             
   	        output
   	    end
   	
		# Metodo que cargar los datos
		#
        # @param nombre [String]
        # @param options [hash]
   	    def datos(nombre, options = {})
            @datos = Granja::Datos.new(@identificacion, nombre, options[:tipo], options[:descripcion])
   	    end
   	
		# Metodo que carga los ejemplares
        #
        # @param id [Number]
        # @param options [hash]
   	    def ejemplar(id, options = {})
   	        ejemplar = Granja::Animal.new(id, options[:edad], options[:peso], options[:precio_compra], options[:precio_venta])	
   	        @ejemplares << ejemplar
   	    end
   	end
end
