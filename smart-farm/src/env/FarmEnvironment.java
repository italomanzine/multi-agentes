// Código do artefato FarmEnvironment

package env;

import cartago.*;

public class FarmEnvironment extends Artifact {
    private double temperatura = 25.0; // Temperatura inicial em Celsius

    void init() {
        defineObsProperty("clima", "ensolarado");
        defineObsProperty("temperatura", temperatura);
    }

    @OPERATION
    void lerTemperatura(OpFeedbackParam<Double> temp) {
        temp.set(temperatura);
    }

    @OPERATION
    void alterarClima(String novoClima) {
        ObsProperty prop = getObsProperty("clima");
        prop.updateValue(novoClima);
        signal("climaAlterado", novoClima);
    }

    @OPERATION
    void aumentarTemperatura(double incremento) {
        temperatura += incremento;
        getObsProperty("temperatura").updateValue(temperatura);
        signal("temperaturaAlterada", temperatura);
    }

    @OPERATION
    void diminuirTemperatura(double decremento) {
        temperatura -= decremento;
        getObsProperty("temperatura").updateValue(temperatura);
        signal("temperaturaAlterada", temperatura);
    }
}