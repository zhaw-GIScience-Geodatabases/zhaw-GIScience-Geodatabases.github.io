
## Publish

Since we have two profiles with nested `output-dir`s, we cannot publish with `quarto publish`. Use `ghp-import`instead:

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