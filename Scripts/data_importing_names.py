#print(', '.join([f'col{i} TEXT' for i in range(1, 75)]))

# columns = "pl_name,hostname,sy_snum,sy_pnum,discoverymethod,disc_year,\
#     disc_facility,pl_controv_flag,pl_orbper,pl_orbpererr1,pl_orbpererr2,\
#     pl_orbperlim,pl_orbsmax,pl_orbsmaxerr1,pl_orbsmaxerr2,pl_orbsmaxlim,\
#     pl_rade,pl_radeerr1,pl_radeerr2,pl_radelim,pl_radj,pl_radjerr1,\
#     pl_radjerr2,pl_radjlim,pl_bmasse,pl_bmasseerr1,pl_bmasseerr2,\
#     pl_bmasselim,pl_bmassj,pl_bmassjerr1,pl_bmassjerr2,pl_bmassjlim,\
#     pl_bmassprov,pl_orbeccen,pl_orbeccenerr1,pl_orbeccenerr2,\
#     pl_orbeccenlim,pl_eqt,pl_eqterr1,pl_eqterr2,pl_eqtlim,st_spectype,\
#     st_teff,st_tefferr1,st_tefferr2,st_tefflim,st_rad,st_raderr1,\
#     st_raderr2,st_radlim,st_mass,st_masserr1,st_masserr2,st_masslim,\
#     st_met,st_meterr1,st_meterr2,st_metlim,st_metratio,rastr,ra,decstr,\
#     dec,sy_dist,sy_disterr1,sy_disterr2,sy_vmag,sy_vmagerr1,sy_vmagerr2,\
#     sy_kmag,sy_kmagerr1,sy_kmagerr2,sy_gaiamag,sy_gaiamagerr1,\
#     sy_gaiamagerr2".split(",")
# print("CREATE TABLE exoplanets (")
# for col in columns:
#     print(f"    {col.strip()} TEXT,")
# print(");")


columns = "pl_controv_flag,pl_radj,pl_radjerr1,pl_radjerr2,pl_radjlim,\
    pl_bmassj,pl_bmassjerr1,pl_bmassjerr2,pl_bmassjlim,\
    st_spectype,st_teff,st_tefferr1,st_tefferr2,st_tefflim,st_rad,\
    st_raderr1,st_raderr2,st_radlim,st_mass,st_masserr1,st_masserr2,\
    st_masslim,st_met,st_meterr1,st_meterr2,st_metlim,st_metratio,rastr,\
    ra,decstr,decl,sy_vmag,sy_vmagerr1,sy_vmagerr2,sy_kmag,sy_kmagerr1,\
    sy_kmagerr2".split(",")
print("ALTER TABLE staging_exoplanets")
for col in columns:
    print(f"    DROP COLUMN {col.strip()},")
print(";")

columns = "pl_orbpererr1,pl_orbpererr2,pl_orbperlim,\
    pl_orbsmaxerr1,pl_orbsmaxerr2,pl_orbsmaxlim,\
    pl_radjerr1,pl_radjerr2,pl_radjlim,\
    pl_bmasseerr1,pl_bmasseerr2,pl_bmasselim,\
    pl_orbeccenerr1,pl_orbeccenerr2,pl_orbeccenlim,pl_eqterr1,pl_eqterr2,\
    sy_disterr1,sy_disterr2,sy_gaiamagerr1,sy_gaiamagerr2".split(",")
print("ALTER TABLE staging_exoplanets")
for col in columns:
    print(f"    DROP COLUMN {col.strip()},")
print(";")
