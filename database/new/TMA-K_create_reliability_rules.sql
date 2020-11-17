-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
-- ATMOSPHERE - http://www.atmosphere-eubrazil.eu/
-- 
-- 
-- Trustworthiness Monitoring & Assessment Framework
-- Component: Knowledge - database
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------
--
-- Normalized MySQL statements for creating the rules of reliability quality model
--
-- @author Jorge Luiz <jorgem@unicamp.br>
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------


USE knowledge;

-- Rules of reliability QM

insert into CompositeRule (ruleId) values (20);

insert into Rule (ruleId, compositeRuleId, name, attributeId, enabled, priority, activationGroup) values (20, 20, "Run container", 10, true, 1, "Reliability Group");

insert into Conditional (conditionId, ruleId, conditionalOperator, value) values (20, 20, 4, "threshold"); -- LESS_THAN

insert into Actuator (actuatorId, address, pubKey) values (3, "http://0.0.0.0:8081/run_container/", "MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgK..."); 

insert into ActionRule (actionRuleId, ruleId, actuatorId, resourceId, actionName) values (20, 20, 3, 202, "run_container");

insert into Configuration (configurationId, actionRuleId, keyName, domain, value) values (20, 20, "container", "str", "run_container");


