// Artifact code for FarmEnvironment

package env;

import cartago.*;

public class FarmEnvironment extends Artifact {
    private double temperature = 25.0; // Initial temperature in Celsius

    void init() {
        defineObsProperty("weather", "sunny");
        defineObsProperty("temperature", temperature);
    }

    @OPERATION
    void readTemperature(OpFeedbackParam<Double> temp) {
        temp.set(temperature);
    }

    @OPERATION
    void changeWeather(String newWeather) {
        ObsProperty prop = getObsProperty("weather");
        prop.updateValue(newWeather);
        signal("weatherChanged", newWeather);
    }

    @OPERATION
    void increaseTemperature(double increment) {
        temperature += increment;
        getObsProperty("temperature").updateValue(temperature);
        signal("temperatureChanged", temperature);
    }

    @OPERATION
    void decreaseTemperature(double decrement) {
        temperature -= decrement;
        getObsProperty("temperature").updateValue(temperature);
        signal("temperatureChanged", temperature);
    }
}