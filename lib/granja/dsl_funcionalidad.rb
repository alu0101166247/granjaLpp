module Granja
	# Clase "DSLFuncionalidad"
   	class DSLFuncionalidad
		
		# Constructor de la clase
        # 
        # @param identificacion [String]
        # @param &block [block]
   	    def initialize(identificacion, &block)
			@identificacion = identificacion
   	      	@beneficio
   	      	@bienestar
   	      	@productividad
       	
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
   	      	output = "Funcionalidad:\n"
   	      	output << "Identificacion: #{@identificacion}\n"
   	      	output << "Beneficio: #{@beneficio}\n"
   	      	output << "Bienestar: #{@bienestar}\n"
   	      	output << "Productividad: #{@productividad}\n"
			 
   	      	output
   	    end
   	
		# Metodo que cargar los beneficios
		#
        # @param granja [Object]
   	    def beneficio(granja)
            @beneficio = Granja::Funcion::beneficio_neto(granja)
   	    end
   	
		# Metodo que cargar el bienestar
		#
        # @param granja [Object]
        # @param options [hash]
   	    def bienestar(granja, options = {})        	
   	      	@bienestar = Granja::Funcion::bienestar_animal(granja, options[:condiciones])
   	    end

		# Metodo que cargar la productividad
		#
        # @param granja [Object]
        # @param options [hash]
		def productividad(granja, options = {})
			@productividad = Granja::Funcion::indice_productividad(granja, options[:condiciones])
	  	end
   	end
end
