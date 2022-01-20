RSpec.describe Granja do
    context "Interfaz de las funcionalidades - Granja::Funcion" do
        context "Componentes del modulo Funcion" do 
            it "Existe un modulo para almacenar las funcionalidades" do
                expect(Granja::Funcion).not_to be(nil)
            end
            it "Existe una constante para representar las condiciones de vida" do  
                expect(Granja::Funcion::CONDICIONES_DE_VIDA).not_to be(nil)
            end
            it "Existe un procedimiento para establecer los cuidados de los animales" do
                class Test include Granja::Funcion end 
                test = Test.new
                expect(test.respond_to?(:definirCuidados)).to be(true)
            end
            it "Existe un procedimiento para establecer la reproduccion de los animales" do 
                class Test include Granja::Funcion end 
                test = Test.new
                expect(test.respond_to?(:definirReproduccion)).to be(true)
            end
        end
        context "Herencia del modulo Funcion" do
            it "Se espera que sea un objeto de la clase Module" do 
                expect(Granja::Funcion.is_a? Module).to eq(true)
            end
            it "Se espera que sea un objeto (Object)" do 
                expect(Granja::Funcion.is_a? Object).to eq(true)
            end
            it "Se espera que sea un objeto basico (BasicObject)" do 
                expect(Granja::Funcion.is_a? BasicObject).to eq(true)
            end
            it "No se espera que sea una instancia de la clase que representa una cadena (String)" do 
                expect(Granja::Funcion.is_a? String).to eq(false)
            end
            it "No se espera que sea una instancia de la clase que representa un numero (Numeric)" do 
                expect(Granja::Funcion.is_a? Numeric).to eq(false)
            end
        end
    end
end
