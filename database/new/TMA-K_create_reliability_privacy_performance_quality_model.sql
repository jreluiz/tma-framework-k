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
-- Normalized MySQL statements for creating the reliability, privacy and performance quality model
--
-- @author Jorge Luiz <jorgem@unicamp.br>
-- 
-- ------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------


USE knowledge;

-- Reliability, Privacy and Performance QualityModel

insert into CompositeAttribute (attributeId, operator) values (1,0);
insert into CompositeAttribute (attributeId, operator) values (2,0);
insert into CompositeAttribute (attributeId, operator) values (5,0);
insert into CompositeAttribute (attributeId, operator) values (8,0);

insert into Attribute (attributeId, compositeattributeId, name) values (1, 1, 'TRUSTWORTHINESS');
insert into Attribute (attributeId, compositeattributeId, name) values (2, 1, 'PRIVACY');
insert into Attribute (attributeId, compositeattributeId, name) values (3, 2, 'INFORMATIONLOSS');
insert into Attribute (attributeId, compositeattributeId, name) values (4, 2, 'REIDENTIFICATIONRISK');
insert into Attribute (attributeId, compositeattributeId, name) values (5, 1, 'PERFORMANCE');
insert into Attribute (attributeId, compositeattributeId, name) values (6, 5, 'RATIOOFCPUUSAGEOFTHEPRIVAAASCONTAINER');
insert into Attribute (attributeId, compositeattributeId, name) values (7, 5, 'RATIOOFMEMORYUSAGEOFTHEPRIVAAASCONTAINER');
insert into Attribute (attributeId, compositeattributeId, name) values (8, 1, 'RELIABILITY');
insert into Attribute (attributeId, compositeattributeId, name) values (9, 8, 'ANONYMIZATIONFAILURE');
insert into Attribute (attributeId, compositeattributeId, name) values (10, 8, 'CONTAINERFAILURE');

insert into LeafAttribute (attributeId, normalizationMin, normalizationMax, operator, numSamples, normalizationKind) values (3, 0.0, 1.0, 0, 1, 1);
insert into LeafAttribute (attributeId, normalizationMin, normalizationMax, operator, numSamples, normalizationKind) values (4, 0.0, 1.0, 0, 1, 1);
insert into LeafAttribute (attributeId, normalizationMin, normalizationMax, operator, numSamples, normalizationKind) values (6, 0.0, 1.0, 0, 1, 1);
insert into LeafAttribute (attributeId, normalizationMin, normalizationMax, operator, numSamples, normalizationKind) values (7, 0.0, 1.0, 0, 1, 1);
insert into LeafAttribute (attributeId, normalizationMin, normalizationMax, operator, numSamples, normalizationKind) values (9, 0.0, 1.0, 0, 1, 1);
insert into LeafAttribute (attributeId, normalizationMin, normalizationMax, operator, numSamples, normalizationKind) values (10, 0.0, 1.0, 0, 1, 1);

insert into ConfigurationProfile (configurationprofileId, active) values (1, true);

insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (1, 1, 1, 1, 0.9);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (2, 2, 1, 0.4, 0.9390);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (3, 3, 1, 0.1, 0.7);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (4, 4, 1, 0.9, 0.05);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (5, 5, 1, 0.2, 0.6);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (6, 6, 1, 0.1, 0.5);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (7, 7, 1, 0.9, 0.3);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (8, 8, 1, 0.2, 0.58);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (9, 9, 1, 0.4, 0.9);
insert into Preference (preferenceId, attributeId, configurationprofileId, weight, threshold) values (10, 10, 1, 0.6, 0.7);

insert into Probe (probeId, probeName, password, salt, token, tokenExpiration) values (8, 'PRIVAaaS', '', '', '', '2020-05-26 00:00:00.000000');
insert into Resource (resourceId, resourceName, resourceType, resourceAddress) values (8, 'PRIVAaaS', 'Privacy', 'na');
insert into Description (descriptionId, dataType, descriptionName, unit) values (30, 'int', 'k', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (31, 'double', 'riskP', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (32, 'double', 'riskJ', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (33, 'double', 'riskM', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (34, 'double', 'score', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (35, 'double', 'id', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (36, 'double', 'privaaas_failure', '');

insert into Probe (probeId, probeName, password, salt, token, tokenExpiration) values (101, 'Docker', '', '', '', '2020-05-26 00:00:00.000000');
insert into Resource (resourceId, resourceName, resourceType, resourceAddress) values (102, 'Docker', 'Performance', 'na');
insert into Description (descriptionId, dataType, descriptionName, unit) values (103, 'double', 'cpu_usage', '');
insert into Description (descriptionId, dataType, descriptionName, unit) values (104, 'double', 'memory_usage', '');

insert into Probe (probeId, probeName, password, salt, token, tokenExpiration) values (201, 'ContainerFailure', '', '', '', '2020-08-01 00:00:00.000000');
insert into Resource (resourceId, resourceName, resourceType, resourceAddress) values (202, 'ContainerFailure', 'Reliability', 'na');
insert into Description (descriptionId, dataType, descriptionName, unit) values (203, 'double', 'number_of_container_failures', '');

insert into Metric (attributeId, configurationprofileId, descriptionId, probeId, resourceId, probeName, descriptionName, resourceName, lastTimestampDataInserted) values (3, 1, 34, 8, 8, 'PRIVAaaS', 'score','anonymizator', NULL);
insert into Metric (attributeId, configurationprofileId, descriptionId, probeId, resourceId, probeName, descriptionName, resourceName, lastTimestampDataInserted) values (4, 1, 31, 8, 8, 'PRIVAaaS', 'riskP','anonymizator', NULL);
insert into Metric (attributeId, configurationprofileId, descriptionId, probeId, resourceId, probeName, descriptionName, resourceName, lastTimestampDataInserted) values (6, 1, 103, 101, 102, 'Docker', 'cpu_usage','Docker', NULL);
insert into Metric (attributeId, configurationprofileId, descriptionId, probeId, resourceId, probeName, descriptionName, resourceName, lastTimestampDataInserted) values (7, 1, 104, 101, 102, 'Docker', 'memory_usage','Docker', NULL);
insert into Metric (attributeId, configurationprofileId, descriptionId, probeId, resourceId, probeName, descriptionName, resourceName, lastTimestampDataInserted) values (9, 1, 36, 8, 8, 'PRIVAaaS', 'privaaas_failure','anonymizator', NULL);
insert into Metric (attributeId, configurationprofileId, descriptionId, probeId, resourceId, probeName, descriptionName, resourceName, lastTimestampDataInserted) values (10, 1, 203, 201, 202, 'ContainerFailure', 'number_of_container_failures','ContainerFailure', NULL);


