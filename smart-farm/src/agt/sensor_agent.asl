// Agente sensor_agent

/* Crenças iniciais */
papel(sensor).
status_sensor(ativo).

/* Objetivos iniciais */
!monitorar.

/* Planos */

+!monitorar : true
    <- .print("Sensor ativo. Monitorando...");
       !gerar_temperatura;
       .wait(5000);
       !monitorar.

+!gerar_temperatura : .random([20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40], T)
    <- .print("Temperatura simulada: ", T);
       .send(agricultor, tell, temperatura(T)).

{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }