// Agent que testa 'farmer_agent', 'sensor_agent' e 'animal_agent' no projeto smart_farm

// Inclui os agentes a serem testados
{ include("farmer_agent.asl") }
{ include("sensor_agent.asl") }
{ include("animal_agent.asl") }

// Inclui a biblioteca de teste
{ include("tester_agent.asl") } // do JaCaMo

@[test]
+!test_start
    <-  !start;
        !assert_true( started(_, _, _, _, _, _) ).

// Inclusões padrão para todos os agentes JaCaMo
//{ include("$jacamo/templates/common-cartago.asl") }
//{ include("$jacamo/templates/common-moise.asl") }

// Descomente a inclusão abaixo para ter um agente conforme sua organização
//{ include("$moise/asl/org-obedient.asl") }