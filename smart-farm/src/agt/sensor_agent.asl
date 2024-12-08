// Agent sensor_agent

/* Initial beliefs */
+role(sensor).
+sensor_type(temperature).

/* Initial goals */
!start.

/* Plans */
+!start : true
    <- .print("Sensor agent started.");
       !monitor_environment.

+!monitor_environment : true
    <- .print("Monitoring environment...");
       !read_temperature;
       .wait(5000);
       !monitor_environment.

+!read_temperature : true
    <- .my_name(Name);
       env("FarmEnvironment").readTemperature(T);
       .send(farmer, tell, temperature(T));
       .print(Name, "sent temperature:", T).