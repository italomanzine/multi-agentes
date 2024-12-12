// sensor_agent.asl

// Crenças iniciais
papel(sensor).
status_sensor(ativo).

// Objetivos iniciais
!monitorar.

// Planos
+!monitorar : true
    <- .print("Sensor ativo. Monitorando o ambiente...");
       lerTemperatura(T);
       lerUmidade(U);
       lerLuminosidade(L);
       .print("Dados coletados: Temperatura=", T, "°C, Umidade=", U, "%, Luminosidade=", L);
       .send(agricultor, inform, dados_ambiente(T, U, L));
       .wait(5000);
       !monitorar.

// Inclusão dos templates do Cartago e Moise, se necessário
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }