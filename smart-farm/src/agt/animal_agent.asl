// Agente animal_agent

/* Crenças iniciais */
papel(animal).
status(saudavel).

/* Objetivos iniciais */
!iniciar.

/* Planos */
+!iniciar : true
    <- .print("Agente animal iniciado.");
       !realizar_atividades.

+!realizar_atividades : true
    <- .print("Animal está pastando.");
       .wait(10000);
       .print("Animal está descansando.");
       .wait(5000);
       !realizar_atividades.

+message(agricultor, tell, iniciar_irrigacao)
    <- .print("Recebida instrução para iniciar irrigação.");
       !ir_para_abrigo.

+message(agricultor, tell, parar_irrigacao)
    <- .print("Recebida instrução para parar irrigação.");
       !voltar_pastagem.

+!ir_para_abrigo : true
    <- .print("Animal indo para o abrigo devido à irrigação.").

+!voltar_pastagem : true
    <- .print("Animal voltando para a pastagem após a irrigação.").