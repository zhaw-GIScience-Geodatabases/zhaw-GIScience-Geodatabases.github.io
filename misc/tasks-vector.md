# Vector Data — Tasks (extracted from slides)

## Future exercise idea: Ray casting / point-in-polygon (next session)

**Concept:** Students first try to *invent their own algorithm* for deciding whether a point is inside a polygon — only pen and paper, given a polygon drawn on grid paper and a few test points. After groups share their approaches, reveal the ray casting algorithm: shoot a horizontal ray from the point to the right, count edge crossings — odd = inside, even = outside.

**Why it works:** Developing an algorithm first makes students invested in the solution. The ray casting answer is elegant and surprising. Good discussion points: what happens when the ray passes exactly through a vertex? what about points on an edge?

**Format:** ~30 min group work, printable worksheet with polygon + test points on a grid. No computer.

Extracted from the slides 2026-10-30. To be rebuilt into the tasks website.

## Simple Features (`simple-features.qmd`)

1. Create some simple feature geometries (`sfg`) of objects you know "by hand". Create at least one `POINT`, one `LINESTRING` and one `POLYGON` geometry. You can capture the coordinates of the nodes from [map.geo.admin.ch](https://map.geo.admin.ch/) if these are in Switzerland and [openstreetmap.org](https://www.openstreetmap.org) (or similar) if they aren't
2. Create simple feature columns from your `sfg`s. Make sure that you assign the correct CRS
3. Create simple features (`sf`) from your `sfc`s and add some attributes

## Vector I/O (`vector-io.qmd`)

1. Import the datasets from Spatial Analysis I and II using R
2. Explore these datasets by printing the `sf` objects to the console
3. Try different visualization methods

## Spatial Operations (`spatial-operations.qmd`)

From the exercise in **Spatial Analysis I**, solve the following tasks using R:

- Task 2: Thematic Selections (Select by Attributes)
- Task 3: Exporting Selected Features to a New ~~Layer~~ `sf` object
- Task 6: Intersect (Intersection)
- Task 8: Buffer
- Task 9: Spatial Selection (Select by Location)
