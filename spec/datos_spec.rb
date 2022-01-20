RSpec.describe Granja do
    context "Representacion de los Datos de una Granja - Granja::Datos" do
        before :each do
            @granja = Granja::Datos.new("Granja 27", "BioFarm", "ganadera", "Gran granja con 200 hectareas")
        end
        context "Atributos de la clase Datos" do
            it "Tiene una clase para representar Datos" do
                expect(@granja).not_to be(nil)
            end
            it "Tiene un atributo para la identificacion la granja" do
                expect(@granja.identificacion).to eq("Granja 27")
            end
            it "Tiene un atributo para el nombre de la granja" do  
                expect(@granja.nombre).to eq("BioFarm")
            end
            it "Tiene un atributo para el tipo de la granja" do 
                expect(@granja.tipo).to eq("ganadera")
            end
            it "Tiene un atributo para la descripcion de la granja" do 
                expect(@granja.descripcion).to eq("Gran granja con 200 hectareas")
            end
            it "Se obtiene una cadena con la informacion del animal correctamente formateada" do 
                expect(@granja.to_s).to eq("Identificacion: Granja 27, Nombre: BioFarm, Tipo: ganadera, Descripcion: Gran granja con 200 hectareas")
            end
        end
        context "Herencia de la clase Datos" do
            it "Se espera que una instancia de la clase Datos sea un Datos" do 
                expect(@granja.is_a? Granja::Datos).to eq(true)
            end
            it "Se espera que una instancia de la clase Datos sea un objeto (Object)" do 
                expect(@granja.is_a? Object).to eq(true)
            end
            it "Se espera que una instancia de la clase Datos sea un objeto basico (BasicObject)" do 
                expect(@granja.is_a? BasicObject).to eq(true)
            end
            it "No se espera que una instancia de la clase Datos sea una cadena (String)" do 
                expect(@granja.is_a? String).to eq(false)
            end
            it "No se espera que una instancia de la clase Datos sea un numero (Numeric)" do 
                expect(@granja.is_a? Numeric).to eq(false)
            end
        end
    end
end
