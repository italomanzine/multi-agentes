// FarmEnvironment.java

package env;

import cartago.*;

public class FarmEnvironment extends Artifact {

    private double temperatura = 25.0; // Temperatura inicial em Celsius

    void init() {
        defineObsProperty("clima", "ensolarado");
        defineObsProperty("temperatura", temperatura);
        defineObsProperty("umidade", 50.0);
        defineObsProperty("luminosidade", "alta");
    }

    @OPERATION
    void lerTemperatura(OpFeedbackParam<Double> temp) {
        temp.set(temperatura);
    }

    @OPERATION
    void lerUmidade(OpFeedbackParam<Double> umid) {
        double umidade = getObsProperty("umidade").doubleValue();
        umid.set(umidade);
    }

    @OPERATION
    void lerLuminosidade(OpFeedbackParam<String> lum) {
        String luminosidade = getObsProperty("luminosidade").stringValue();
        lum.set(luminosidade);
    }

    @OPERATION
    void lerClima(OpFeedbackParam<String> clima) {
        String currentClima = getObsProperty("clima").stringValue();
        clima.set(currentClima);
    }

    @OPERATION
    void alterarTemperatura(double novaTemperatura) {
        temperatura = novaTemperatura;
        getObsProperty("temperatura").updateValue(temperatura);
        signal("temperaturaAlterada", temperatura);
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

    @OPERATION
    void alterarClima(String novoClima) {
        getObsProperty("clima").updateValue(novoClima);
        signal("climaAlterado", novoClima);
    }

    @OPERATION
    void alterarLuminosidade(String novaLuminosidade) {
        getObsProperty("luminosidade").updateValue(novaLuminosidade);
        signal("luminosidadeAlterada", novaLuminosidade);
    }
}