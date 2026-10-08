
## Todo

2025-11-10:
- The raster part is not implemented in slides yet. Fix this
- The tasks produce no questions. Does it make sense to complete the tasks during class?

2026-10-08: Reduce overlap with IPRS (see details below)

### Context

IPRS (Image Processing for Remote Sensing) runs **before** GISc in the same semester —
its last session (of 4) falls on the same day as GISc's first session. In HS26, 5 of
6 GISc students have already taken IPRS. By the time they arrive at GISc's raster
sections, they have already covered:

- Raster data model (regular grid, cell offsets, continuous vs. discrete)
- Map algebra: local / focal / zonal / global (same Luxembourg elevation example)
- `terra` basics: `rast()`, `project()`, `crop()`, `mask()`, `focal()`, `extract()`
- Raster I/O: `writeRaster()`, GeoTIFF, JP2

Only **1 GISc student** has not taken IPRS and needs these foundations.

### What to change per file

**`raster-data.qmd`**
- Cut or collapse the raster data model intro (cell offsets, values, color figure) —
  identical to IPRS `lesson1-3-imagery.qmd`. Replace with a one-slide recap + reference
  to IPRS materials for the 1 non-IPRS student.
- Keep: continuous vs. discrete distinction (worth a quick reminder in the GISc context).

**`raster-io.qmd`**
- Cut the `rast()` / `writeRaster()` basics — covered in IPRS.
- Keep and expand: file format overview (GeoTIFF, COG, JP2, NetCDF, HDF5) — IPRS only
  touches this briefly. This is where GISc can go deeper.

**`raster-operations.qmd`**
- Cut: global / zonal / local intro and the Luxembourg elevation example — word-for-word
  identical to IPRS `lesson2-1-operations.qmd`.
- Keep and expand: **focal operations** — IPRS uses focal for feature engineering in
  classification, so GISc can go deeper on kernel design, `fillvalue`, edge effects, etc.
- Consider: replace Luxembourg example with a Swiss dataset to differentiate from IPRS.

**`raster-vector-operations.qmd`**
- Cut: `extract()` basics — covered in IPRS `lesson4-2-supervised-learning.qmd`.
- Keep and expand: vector-to-raster conversion (`rasterize()`), zonal stats with vector
  polygons — IPRS does not cover these directions.

### What GISc should own (not in IPRS)
- Full vector model: simple features, vector I/O, spatial operations — no overlap
- Spatial databases / PostGIS angle (the "Geodatabases" part of the course title)
- Deeper file format knowledge (COG, NetCDF, HDF5)
- Vector-raster integration in both directions (`rasterize()`, `as.polygons()`)


## Render / Publish 

**Render**: We have two version of the output: *profile: book* and no profile. Always render
`book` first, then no profile. If done vice versa, the `slides` folder in `_book` 
is lost.


```
quarto render --profile book    # render with profile book
quarto render                   # render default
```


**Publish**:  Since we have two profiles with nested `output-dir`s, we cannot publish with `quarto publish`. Use `ghp-import`instead:

```
ghp-import -p _book
```


# Profile

```
[(see @sec-plotting)]{.content-hidden unless-profile="book"}
```


# Link to slides

Add the following to create a "View as slides" link that only appears in book profile:

```
[]{.lts .content-hidden unless-profile="book"}
```

**How it works:**

1. Add `[]{.lts .content-hidden unless-profile="book"}` in your Quarto markdown
2. This creates an empty span with class `lts` that only appears in book profile (hidden in slides)
3. JavaScript finds `.lts` and replaces it with a link: `slides/currentFile.html`

**Result:** Book pages get a "View as slides" link, but slides themselves don't show this link (prevented by the `unless-profile="book"` filter).