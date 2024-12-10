// Agente farmer_agent

/* Crenças iniciais */
papel(agricultor).
status_campo(ok).

/* Objetivos iniciais */
!iniciar.

/* Planos */
+!iniciar : true
    <- .print("Agente agricultor iniciado");
       !gerenciar_fazenda.

+!gerenciar_fazenda : temperatura(T)
    <- .print("Gerenciando a fazenda...");
       !tomar_decisoes(T);
       .wait(5000);
       !gerenciar_fazenda.

+!gerenciar_fazenda : true
    <- .wait(5000);
       !gerenciar_fazenda.

+!tomar_decisoes(T) : T > 30
        <- .print("Temperatura alta. Iniciando irrigação.");
           .broadcast(tell, iniciar_irrigacao);
           -+status_campo(irrigando).

+!tomar_decisoes(T) : T <= 30
        <- .print("Temperatura normal. Parando irrigação.");
           .broadcast(tell, parar_irrigacao);
           -+status_campo(irrigando);
           +status_campo(ok).

+message(animal, tell, status(S))
    <- .print("Recebido status do animal: ", S).