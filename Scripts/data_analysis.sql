SELECT *
FROM staging_exoplanets;

# Most effective detection methods
CREATE VIEW vw_detection_methods AS
SELECT
    discoverymethod,
    COUNT(*) AS num_planets
FROM staging_exoplanets
GROUP BY discoverymethod
ORDER BY num_planets DESC;


# Missions with the most discoveries
CREATE VIEW vw_discovery_facility AS
SELECT
    disc_facility,
    COUNT(*) AS num_planets
FROM staging_exoplanets
GROUP BY disc_facility
ORDER BY num_planets DESC;

# Rolling total of exoplanet discoveries
CREATE VIEW vw_rolling_discoveries AS
SELECT 
  YEAR(disc_date) AS disc_year,
  COUNT(*) AS planets_this_year,
  SUM(COUNT(*)) OVER (
    ORDER BY YEAR(disc_date)
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
  ) AS cumulative_discoveries
FROM staging_exoplanets
GROUP BY YEAR(disc_date)
ORDER BY disc_year;

# Rank exoplanets by mass within each discovery year
SELECT *
FROM (
  SELECT 
    pl_name, 
    YEAR(disc_date) AS disc_year, 
    pl_bmasse,
    RANK() OVER (
      PARTITION BY YEAR(disc_date) 
      ORDER BY pl_bmasse DESC
    ) AS mass_rank
  FROM staging_exoplanets
) AS ranked
WHERE mass_rank <= 3
ORDER BY disc_year, mass_rank;

# Exoplanet properties

# How do the average exoplanet properties change every year
CREATE VIEW vw_exoplanet_properties AS
SELECT
	YEAR(disc_date) AS disc_year,
    AVG(pl_rade) AS avg_radius,
    AVG(pl_bmasse) AS avg_mass,
    AVG(sy_dist) AS avg_distance,
    AVG(sy_gaiamag) AS avg_magnitude
FROM staging_exoplanets
GROUP BY YEAR(disc_date)
ORDER BY disc_year;

# Mass vs. radius plot
CREATE VIEW vw_exoplanet_mass_vs_radius AS
SELECT
	discoverymethod AS discovery_method,
	pl_bmasse AS mass,
    pl_rade AS radius
FROM staging_exoplanets
ORDER BY pl_bmasse;

# Density plot of planet masses, split by discovery type
CREATE VIEW vw_exoplanet_mass_bins_by_method AS
SELECT
  FLOOR(pl_bmasse / 1) * 1 AS mass_bin_earth,
  discoverymethod AS discovery_method,
  COUNT(*) AS planet_count
FROM staging_exoplanets
GROUP BY mass_bin_earth, discoverymethod
ORDER BY mass_bin_earth, discoverymethod;

# Kepler's third law
CREATE VIEW vw_exoplanet_kepler_third_law AS
SELECT
  discoverymethod AS discovery_method,
  POWER(pl_orbper, 2) AS orbital_period_squared,
  POWER(pl_orbsmax, 3) AS semi_major_axis_cubed
FROM staging_exoplanets;
