// Agent animal_agent

/* Initial beliefs */
+role(animal).
+status(healthy).

/* Initial goals */
!start.

/* Plans */
+!start : true
    <- .print("Animal agent started.");
       !perform_activities.

+!perform_activities : true
    <- .print("Animal is grazing.");
       .wait(10000);
       .print("Animal is resting.");
       .wait(5000);
       !perform_activities.

+message(farmer, tell, start_irrigation)
    <- .print("Received start irrigation signal.");
       !move_to_shelter.

+!move_to_shelter : true
    <- .print("Animal moving to shelter due to irrigation.");