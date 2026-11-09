# Toy dataset for areal-interpolation.qmd
# Three source zones (A, B, C) and two target zones (X, Y) that cut across them.
# X covers all of A (area 6) + left half of B (area 3).
# Y covers right half of B (area 3) + all of C (area 6).
# Expected extensive result: X = 600 + 450 = 1050, Y = 450 + 300 = 750 (total 1800)
# Expected intensive result: X = (80*2 + 60*1)/3 = 73.3,  Y = (60*1 + 70*2)/3 = 66.7

library(sf)
library(dplyr)

# ── real data (used for core-challenge visualization) ─────────────────────────
cantons <- st_read(
  "data/swissBOUNDARIES3D_1_5_LV95_LN02.gpkg",
  layer = "tlm_kantonsgebiet", quiet = TRUE
)

biogeo <- st_read("data/biogeo.gpkg", quiet = TRUE)

# ── toy data (used for st_interpolate_aw() examples) ─────────────────────────
src <- st_sf(
  zone       = c("A", "B", "C"),
  population = c(600, 900, 300),   # extensive: total count
  income_avg = c(80,  60,  70),    # intensive: average (kCHF/year)
  geometry   = st_sfc(
    st_polygon(list(matrix(c(0,0, 2,0, 2,3, 0,3, 0,0), ncol=2, byrow=TRUE))),
    st_polygon(list(matrix(c(2,0, 4,0, 4,3, 2,3, 2,0), ncol=2, byrow=TRUE))),
    st_polygon(list(matrix(c(4,0, 6,0, 6,3, 4,3, 4,0), ncol=2, byrow=TRUE)))
  )
)

tgt <- st_sf(
  zone     = c("X", "Y"),
  geometry = st_sfc(
    st_polygon(list(matrix(c(0,0, 3,0, 3,3, 0,3, 0,0), ncol=2, byrow=TRUE))),
    st_polygon(list(matrix(c(3,0, 6,0, 6,3, 3,3, 3,0), ncol=2, byrow=TRUE)))
  )
)
