// farmer_agent.asl

// Crenças iniciais
papel(agricultor).
status_campo(ok).

// Objetivos iniciais
!iniciar.

// Planos
+!iniciar : true
    <- .print("Agente agricultor iniciado.");
       !gerenciar_fazenda.

+!gerenciar_fazenda
    <- .print("Gerenciando a fazenda...");
       !verificar_ambiente;
       .wait(5000);
       !gerenciar_fazenda.

+!verificar_ambiente
    <- lerTemperatura(T);
       lerUmidade(U);
       lerLuminosidade(L);
       .print("Dados do Ambiente: Temperatura=", T, "°C, Umidade=", U, "%, Luminosidade=", L);
       !tomar_decisoes(T, U, L).

+!tomar_decisoes(T, U, L)
    <- if (T > 30 & U < 40) {
           .print("Condições de seca detectadas. Iniciando irrigação.");
           alterarClima("irrigando");
           diminuirTemperatura(2);
           .broadcast(tell, iniciar_irrigacao);
           -+status_campo(irrigando);
       } else if (T < 15) {
           .print("Temperatura baixa detectada. Aumentando temperatura.");
           aumentarTemperatura(3);
       } else if (L == "baixa") {
           .print("Luminosidade baixa detectada. Ajustando luminosidade.");
           alterarLuminosidade("alta");
       } else {
           .print("Condições adequadas. Continuando monitoramento.");
       }.

+message(sensor, inform, dados_ambiente(T, U, L))
    <- .print("Dados recebidos do sensor: Temperatura=", T, "°C, Umidade=", U, "%, Luminosidade=", L);
       !tomar_decisoes(T, U, L).

// Inclusão dos templates do Cartago e Moise, se necessário
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }