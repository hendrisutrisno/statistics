# learning-statistics

A small, ReadTheDocs-like static site to store learning resources on statistics.

You can preview locally by starting a simple HTTP server from the repository root:

  $ python -m http.server 8000
  # then open http://localhost:8000/docs/ in your browser

Or use any static hosting (GitHub Pages, Netlify, etc.).

Content structure is defined in `content/structure.json`. Markdown pages live in `content/`.

Sections
1. Introduction
2. Demos
3. Probability basics
4. Random variables & distributions
5. Statistical inference
6. Regression & GLMs
7. Time series
8. Bayesian methods
9. Resampling & bootstrapping
10. Hypothesis testing
11. Experimental design
12. Data visualization
13. Multivariate analysis
14. Machine learning
15. Resources

This project uses a tiny client-side app and [marked](https://github.com/markedjs/marked) to render markdown.
