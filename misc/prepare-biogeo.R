# Prepare exercise data for session 2.
# Outputs: data/biogeo.gpkg, data/swissboundaries-cantons.gpkg
library(sf)
library(dplyr)

# ── Canton boundaries ─────────────────────────────────────────────────────────
st_read("data/swissBOUNDARIES3D_1_5_LV95_LN02.gpkg",
        layer = "tlm_kantonsgebiet", quiet = TRUE) |>
  st_write("data/swissboundaries-cantons.gpkg", append = FALSE)

# ── Biogeographic regions ─────────────────────────────────────────────────────

biogeo <- st_read("data/BiogeographischeRegionen.gdb",
                  layer = "N2020_Revision_BiogeoRegion", quiet = TRUE) |>
  group_by(RegionNummer) |>
  summarise(.groups = "drop") |>
  mutate(region_de = c(
    "1" = "Jura", "2" = "Mittelland", "3" = "Alpennordflanke",
    "4" = "W. Zentralalpen", "5" = "Ö. Zentralalpen", "6" = "Alpensüdflanke"
  )[as.character(RegionNummer)])

st_write(biogeo, "data/biogeo.gpkg", append = FALSE)
