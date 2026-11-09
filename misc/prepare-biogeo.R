# Dissolve 12 biogeographic sub-regions to 6 main regions and add German names.
# Output: data/biogeo.gpkg
library(sf)
library(dplyr)

biogeo <- st_read("data/BiogeographischeRegionen.gdb",
                  layer = "N2020_Revision_BiogeoRegion", quiet = TRUE) |>
  group_by(RegionNummer) |>
  summarise(.groups = "drop") |>
  mutate(region_de = c(
    "1" = "Jura", "2" = "Mittelland", "3" = "Alpennordflanke",
    "4" = "W. Zentralalpen", "5" = "Ö. Zentralalpen", "6" = "Alpensüdflanke"
  )[as.character(RegionNummer)])

st_write(biogeo, "data/biogeo.gpkg", append = FALSE)
