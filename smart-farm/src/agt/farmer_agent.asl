// Agent farmer_agent

/* Initial beliefs */
+role(farmer).
+field_status(ok).

/* Initial goals */
!start.

/* Plans */
+!start : true
    <- .print("Farmer agent started.");
       !manage_farm.

+!manage_farm : true
    <- !check_sensors;
       !make_decisions;
       .wait(5000);
       !manage_farm.

+!check_sensors : true
    <- .print("Checking sensors...");
       ?temperature(T);
       .print("Current temperature:", T).

+!make_decisions : true
    <- temperature(T) &
       T > 30
       <- .print("Temperature is high. Starting irrigation.");
          .broadcast(tell, start_irrigation);
          -+field_status(irrigating).
       ;  .print("Temperature is normal.");.

+temperature(_).

+message(sensor, tell, temperature(T))
    <- .print("Received temperature from sensor:", T);
       -+temperature(T).

+message(sensor, tell, humidity(H))
    <- .print("Received humidity from sensor:", H);
       -+humidity(H).

+message(animal, tell, status(S))
    <- .print("Received status from animal:", S).

+!stop_irrigation : true
    <- .print("Stopping irrigation.");
       .broadcast(tell, stop_irrigation);
       -field_status(irrigating);
       +field_status(ok).