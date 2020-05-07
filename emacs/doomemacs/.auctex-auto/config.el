(TeX-add-style-hook
 "config"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("inputenc" "utf8") ("fontenc" "T1") ("ulem" "normalem")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "inputenc"
    "fontenc"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref")
   (LaTeX-add-labels
    "sec:orgb9c3954"
    "sec:orge73f82d"
    "sec:orgd7f2627"
    "sec:org35c2e24"
    "sec:orgf51b459"
    "sec:orgb99e681"
    "sec:org7db797e"
    "sec:org7c580fa"
    "sec:orgad1cf64"
    "sec:orge5bc2e4"
    "sec:org54dbb5f"
    "sec:org951528e"
    "sec:org7390009"
    "sec:org3b569ce"
    "sec:org33d0f25"
    "sec:orgefc8454"
    "sec:orge6d15ad"
    "sec:org00bcbcf"
    "sec:orgce5437e"
    "sec:org1267199"
    "sec:org6ffa2d7"
    "sec:org9a6e6df"
    "sec:org7151ff0"
    "sec:org61924b7"
    "sec:orgaea5c1d"
    "sec:org13ca95a"
    "sec:org40e88ac"
    "sec:org31c75f2"))
 :latex)

