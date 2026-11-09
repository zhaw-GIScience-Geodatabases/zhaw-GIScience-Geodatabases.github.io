
## Lessons Learned HS26

### General

- **Dropping raster data was the right call.** Most students come from IPRS and have already covered the raster model, map algebra, and `terra` basics (see Context below). Keeping it would mean repeating content they already know for the sake of one student.
  - **Action**: Communicate this to Pascal so he can adjust the course schedule accordingly.
  - **Action**: Add a link to the IPRS course (or its materials) so students not enrolled in IPRS can cover the raster content themselves.

### Session 1 — Vector Data (2 × 90 min)

- Worked out well overall.
- The slide content did not fully fill two lessons — pacing was faster than expected.
- The two challenges (bounding box, point-in-polygon) were well received.
  - **Idea**: Add a gamification element — e.g. teams, scoring, live leaderboard, or a time challenge.

### Session 2 — Vector Geometry (2 × 90 min)

- **Geometry operations** felt dry. Needs more concrete, motivating examples to make the content stick.
  - **Affine transformations**: kept in the lecture because the main thing this section teaches is *"geometries are coordinate arrays and you can do math on them"* — a useful mental model. But the real-world use cases are thin (CRS changes → `st_transform()`, setbacks → `st_buffer()`, georeferencing → QGIS). Dropped from the exercise for this reason; does not need a dedicated scenario.
- **Areal interpolation** was interesting but requires more preparation and confidence on the content. More concrete real-world examples (beyond the toy A/B/C dataset) would help.
- **Pacing issue**: The two topics (geometry operations + areal interpolation) only filled ~1 lesson even at a relaxed pace. The session needs more content to fill the second slot.
  - **Idea**: Add **Spherical Geometry** as a third topic for Session 2.

---

## Todo

### Session 2 — Areal Interpolation Exercise

- **Extensive-only is a simplification.** The current exercise only practises extensive interpolation (`gdp_2024`). The extensive/intensive distinction is introduced in the lecture but never exercised. Consider:
  - **Option 2**: Add a task "interpolate `gdp_2024` and `einwohnerzahl` both extensively, then derive `gdp_region / pop_region`." This teaches the correct pattern for ratio variables and is self-contained.
  - **Option 3**: Keep a "wrong then right" pair — first interpolate `gdp_per_capita` intensively, then show why `gdp / pop` from two extensive interpolations gives a different (more correct) result. Rich but complex.
  - Either option works best if the **theory slide** (areal-interpolation.qmd) first alludes to the trap: *"Intensive interpolation of a ratio (e.g. income/person) gives an area-weighted mean of ratios — not the true per-capita of the target zone. For ratios, interpolate numerator and denominator separately."*

- **Dasymetric mapping extension**: use municipality-level `einwohnerzahl` (from `swissBOUNDARIES3D`) or building footprint data as an ancillary layer in `st_interpolate_aw(..., weights = ...)` to improve GDP redistribution. Natural follow-up once students have grasped the uniform-distribution limitation in 2.10.

## Context

IPRS (Image Processing for Remote Sensing) runs **before** GISc in the same semester —
its last session (of 4) falls on the same day as GISc's first session. In HS26, 5 of
6 GISc students have already taken IPRS. By the time they arrive at GISc's raster
sections, they have already covered:

- Raster data model (regular grid, cell offsets, continuous vs. discrete)
- Map algebra: local / focal / zonal / global (same Luxembourg elevation example)
- `terra` basics: `rast()`, `project()`, `crop()`, `mask()`, `focal()`, `extract()`
- Raster I/O: `writeRaster()`, GeoTIFF, JP2

Only **1 GISc student** has not taken IPRS and needs these foundations.



---

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