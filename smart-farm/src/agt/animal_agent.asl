// animal_agent.asl

// Crenças iniciais
papel(animal).
status(saudavel).

// Objetivos iniciais
!iniciar.

// Planos
+!iniciar : true
    <- .print("Agente animal iniciado.");
       !realizar_atividades;

+realizar_atividades
    <- lerClima(Clima);
       if (Clima == "irrigando") {
           .print("Irrigação em andamento. Indo para o abrigo.");
           !ir_para_abrigo;
       } else {
           .print("Tempo bom. Pastando no campo.");
           .wait(5000);
       };
       !realizar_atividades.

+!ir_para_abrigo : true
    <- .print("Animal indo para o abrigo.");
       .wait(5000).

+!voltar_pastagem : true
    <- .print("Animal voltando para a pastagem.");
       .wait(5000).

+climaAlterado(NovoClima)
    <- .print("Clima alterado para: ", NovoClima);
       if (NovoClima == "irrigando") {
           !ir_para_abrigo;
       } else {
           !voltar_pastagem;
       }.

+message(agricultor, tell, iniciar_irrigacao)
    <- .print("Recebida instrução para iniciar irrigação.");
       !ir_para_abrigo.

+message(agricultor, tell, parar_irrigacao)
    <- .print("Recebida instrução para parar irrigação.");
       !voltar_pastagem.

// Inclusão dos templates do Cartago e Moise, se necessário
{ include("$jacamoJar/templates/common-cartago.asl") }
{ include("$jacamoJar/templates/common-moise.asl") }