-- Name : Amy Sauden
-- Water Treatment Analysis



USE water_treatment_analysis
GO

--1.Which treatment system has the lowest average DALY (health risk)?

SELECT 
    treatment,
    AVG(daly) AS avg_daly
FROM NEWR_clean
GROUP BY treatment
ORDER BY avg_daly;



--2. What is the average cost per gallon for each treatment system?
SELECT
    AVG(ach_net_net_present_value_gal)   AS ach_cost,
    AVG(ar_net_net_present_value_gal)    AS ar_cost,
    AVG(gwmbr_net_net_present_value_gal) AS gwmbr_cost,
    AVG(rwh_net_net_present_value_gal)   AS rwh_cost,
    AVG(wwmbr_net_net_present_value_gal) AS wwmbr_cost
FROM NEWR_clean;

--3. Compare environmental footprint (global warming potential) across treatments
SELECT
    AVG(ach_net_global_warming_potential_kg_co2_eq_gal)   AS ach_gwp,
    AVG(ar_net_global_warming_potential_kg_co2_eq_gal)    AS ar_gwp,
    AVG(gwmbr_net_global_warming_potential_kg_co2_eq_gal) AS gwmbr_gwp,
    AVG(rwh_net_global_warming_potential_kg_co2_eq_gal)   AS rwh_gwp,
    AVG(wwmbr_net_global_warming_potential_kg_co2_eq_gal) AS wwmbr_gwp
FROM NEWR_clean;


--- 4.Identify ZIP codes with the highest DALY (health risk hotspots)
SELECT TOP 10
    zip_code,
    AVG(daly) AS avg_daly
FROM NEWR_clean
GROUP BY zip_code
ORDER BY avg_daly DESC;

--- 5️. What treatment has the lowest carbon footprint and lowest cost?
SELECT 
    treatment,
    AVG(CASE treatment
            WHEN 'ach'   THEN ach_net_global_warming_potential_kg_co2_eq_gal
            WHEN 'ar'    THEN ar_net_global_warming_potential_kg_co2_eq_gal
            WHEN 'gwmbr' THEN gwmbr_net_global_warming_potential_kg_co2_eq_gal
            WHEN 'rwh'   THEN rwh_net_global_warming_potential_kg_co2_eq_gal
            WHEN 'wwmbr' THEN wwmbr_net_global_warming_potential_kg_co2_eq_gal
        END) AS avg_gwp,

    AVG(CASE treatment
            WHEN 'ach'   THEN ach_net_net_present_value_gal
            WHEN 'ar'    THEN ar_net_net_present_value_gal
            WHEN 'gwmbr' THEN gwmbr_net_net_present_value_gal
            WHEN 'rwh'   THEN rwh_net_net_present_value_gal
            WHEN 'wwmbr' THEN wwmbr_net_net_present_value_gal
        END) AS avg_cost
FROM NEWR_clean
GROUP BY treatment
ORDER BY avg_gwp, avg_cost;


--- 6. How much water is produced annually for non-potable demand by ZIP code?
SELECT 
    zip_code,
    SUM(annual_wastewater_provided_for_nonpotable_demand_gal_yr) AS total_nonpotable_water
FROM NEWR_clean
GROUP BY zip_code
ORDER BY total_nonpotable_water DESC;

---7.Which treatment system provides the best energy efficiency?
SELECT 
    treatment,
    AVG(CASE treatment
            WHEN 'ach'   THEN ach_net_cumulative_energy_demand_mj_gal
            WHEN 'ar'    THEN ar_net_cumulative_energy_demand_mj_gal
            WHEN 'gwmbr' THEN gwmbr_net_cumulative_energy_demand_mj_gal
            WHEN 'rwh'   THEN rwh_net_cumulative_energy_demand_mj_gal
            WHEN 'wwmbr' THEN wwmbr_net_cumulative_energy_demand_mj_gal
        END) AS avg_energy
FROM NEWR_clean
GROUP BY treatment
ORDER BY avg_energy;



---8.Which treatment system minimizes water scarcity (liters of water used)?
SELECT 
    treatment,
    AVG(CASE treatment
            WHEN 'ach'   THEN ach_net_water_scarcity_liters_h2o_deprivation_gal
            WHEN 'ar'    THEN ar_net_water_scarcity_liters_h2o_deprivation_gal
            WHEN 'gwmbr' THEN gwmbr_net_water_scarcity_liters_h2o_deprivation_gal
            WHEN 'rwh'   THEN rwh_net_water_scarcity_liters_h2o_deprivation_gal
            WHEN 'wwmbr' THEN wwmbr_net_water_scarcity_liters_h2o_deprivation_gal
        END) AS avg_scarcity
FROM NEWR_clean
GROUP BY treatment
ORDER BY avg_scarcity;



