SELECT *
FROM staging_exoplanets;

# Creating a staging table to make edits 
CREATE TABLE staging_exoplanets
LIKE exoplanets;

INSERT staging_exoplanets
SELECT *
FROM exoplanets;

## Remove Duplicates - no duplicates
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY pl_name, hostname) as row_num 
FROM staging_exoplanets
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

## Standardize the Data
SELECT pl_name, hostname
FROM staging_exoplanets
WHERE hostname LIKE " %";

SELECT DISTINCT pl_controv_flag
FROM staging_exoplanets;

# Combine discoveries from different telescopes of the same system into one facility name
UPDATE staging_exoplanets
SET disc_facility = 'SuperWASP'
WHERE disc_facility LIKE 'SuperWASP%';

UPDATE staging_exoplanets
SET disc_facility = 'KELT'
WHERE disc_facility LIKE 'KELT%';

# Filter rows that are controversial
DELETE FROM staging_exoplanets
WHERE pl_controv_flag = 1;

# Convert columns to the right data type
SELECT *
FROM staging_exoplanets;

ALTER TABLE staging_exoplanets ADD COLUMN disc_date DATE;
UPDATE staging_exoplanets
SET disc_date = STR_TO_DATE(
  CONCAT(SUBSTRING_INDEX(TRIM(disc_year), '.', 1), '-01-01'),
  "%Y-%m-%d"
);

# Change order of column
ALTER TABLE staging_exoplanets
MODIFY COLUMN disc_date DATE AFTER disc_year;

## Handle Null and Blank Values
# No Null values
# Check how many complete rows are in the dataset for the desired columns
SELECT COUNT(*)
FROM staging_exoplanets
WHERE pl_orbper != ""
	AND pl_orbsmax != ""
	AND pl_rade != ""
	AND pl_bmasse != ""
	AND pl_orbeccen != ""
	AND pl_eqt != ""
	AND sy_dist != ""
	AND sy_gaiamag != ""
	AND pl_orbsmax != "";
# Around 3900 rows to work with

# Delete the rows with blank(s)
DELETE 
FROM staging_exoplanets
WHERE pl_orbper = ""
	OR pl_orbsmax = ""
	OR pl_rade = ""
	OR pl_bmasse = ""
	OR pl_orbeccen = ""
	OR pl_eqt = ""
	OR sy_dist = ""
	OR sy_gaiamag = ""
	OR pl_orbsmax = "";
    
SELECT DISTINCT pl_orbpererr1
FROM staging_exoplanets;

## Remove any Columns

ALTER TABLE staging_exoplanets
    DROP COLUMN pl_controv_flag,
    DROP COLUMN pl_radj,
    DROP COLUMN pl_radjerr1,
    DROP COLUMN pl_radjerr2,
    DROP COLUMN pl_radjlim,
    DROP COLUMN pl_orbpererr1,
    DROP COLUMN pl_orbpererr2,
    DROP COLUMN pl_orbperlim,
    DROP COLUMN pl_orbsmaxerr1,
    DROP COLUMN pl_orbsmaxerr2,
    DROP COLUMN pl_orbsmaxlim,
    DROP COLUMN pl_radjerr1,
    DROP COLUMN pl_radjerr2,
    DROP COLUMN pl_radjlim,
    DROP COLUMN pl_bmasseerr1,
    DROP COLUMN pl_bmasseerr2,
    DROP COLUMN pl_bmasselim,
    DROP COLUMN pl_orbeccenerr1,
    DROP COLUMN pl_orbeccenerr2,
    DROP COLUMN pl_orbeccenlim,
    DROP COLUMN pl_eqterr1,
    DROP COLUMN pl_eqterr2,
    DROP COLUMN sy_disterr1,
    DROP COLUMN sy_disterr2,
    DROP COLUMN sy_gaiamagerr1,
    DROP COLUMN sy_gaiamagerr2,
    DROP COLUMN pl_bmassj,
    DROP COLUMN pl_bmassjerr1,
    DROP COLUMN pl_bmassjerr2,
    DROP COLUMN pl_bmassjlim,
    DROP COLUMN st_spectype,
    DROP COLUMN st_teff,
    DROP COLUMN st_tefferr1,
    DROP COLUMN st_tefferr2,
    DROP COLUMN st_tefflim,
    DROP COLUMN st_rad,
    DROP COLUMN st_raderr1,
    DROP COLUMN st_raderr2,
    DROP COLUMN st_radlim,
    DROP COLUMN st_mass,
    DROP COLUMN st_masserr1,
    DROP COLUMN st_masserr2,
    DROP COLUMN st_masslim,
    DROP COLUMN st_met,
    DROP COLUMN st_meterr1,
    DROP COLUMN st_meterr2,
    DROP COLUMN st_metlim,
    DROP COLUMN st_metratio,
    DROP COLUMN rastr,
    DROP COLUMN ra,
    DROP COLUMN decstr,
    DROP COLUMN decl,
    DROP COLUMN sy_vmag,
    DROP COLUMN sy_vmagerr1,
    DROP COLUMN sy_vmagerr2,
    DROP COLUMN sy_kmag,
    DROP COLUMN sy_kmagerr1,
    DROP COLUMN sy_kmagerr2,
    DROP COLUMN pl_radeerr1,
    DROP COLUMN pl_radeerr2,
    DROP COLUMN pl_radelim,
    DROP COLUMN pl_eqtlim
;

ALTER TABLE staging_exoplanets
    DROP COLUMN disc_year;

SELECT *
FROM staging_exoplanets;

SELECT DISTINCT disc_date
FROM staging_exoplanets;