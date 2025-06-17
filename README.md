# elser-mode
Emacs Major-mode for Elser language.

This mode is derived from `lisp-mode` and provides very basic syntax highlighting and indentation for Elser.

## Overview

### Installation
```sh
git clone https://github.com/elser-lang/elser-mode
```
Add this to your `.emacs` file:
```elisp
(add-to-list 'load-path "~/path/to/elser-mode")
(autoload 'elser-mode "elser-mode" nil t)
```

### Highlighting
On top of Lisps's indentation rules Elser's major-mode follows the ideas of explicitness of mutative operations and enforced structure, thus it performs:
- Mutative and critical operations (e.g. `set!` `invoke!`) highlighting with `font-lock-warning-face` to call attention to side‑effects.
- Highlighting of structural keywords (e.g. `storage`, `functions`).
- Highlighting of supported types (e.g. `:i256`, `:addr`).

For example, here's `elser-mode` manually applied to the buffer with initially enabled `clojure-mode`, to show how `elser-mode` differs in terms of highlighting critical operations:

![e](https://github.com/user-attachments/assets/95b3d2a5-cef1-4942-81f7-57f59fa5459a)


