;;; elser-mode.el --- major mode for elser  -*- lexical-binding: t; -*-

(defconst elser-font-lock-keywords
  (let* (
	 
         (structure '("constructor" "storage" "constants" "events" "functions"))
	 (ns-defs '("ns"))
	 
         (visibility '(":external" ":internal"))
	 
         (builtins '("sto" "require" "do" "let" "loop"
		     "assert" "->" "while"))

	 (var-defs '("def"))
	 
	 (func-defs '("defn"))

	 (mutations '("set!" "invoke!" "emit!" "transfer*" "write!" "read!"))
	 
         (simple-types '(":i256" ":u256" ":bool" ":addr" ":b32"))
	 
         (complex-types '("array" "map" "struct")))
    
    `((
       ;; Structuring keywords.
       (,(regexp-opt structure 'words) . font-lock-type-face)
       (,(regexp-opt ns-defs 'words) . font-lock-type-face)
       
       ;; Visibility keywords.
       (,(regexp-opt visibility) . font-lock-builtin-face)
       
       ;; Built-in functions.
       (,(regexp-opt builtins 'words) . font-lock-keyword-face)
       (,(regexp-opt func-defs 'words) . font-lock-keyword-face)
       (,(regexp-opt var-defs 'words) . font-lock-keyword-face)
       (,(regexp-opt mutations) . font-lock-warning-face)       
       
       ;; Simple types.
       (,(regexp-opt simple-types) . font-lock-type-face)
       
       ;; Complex types.
       (,(regexp-opt complex-types 'words) . font-lock-type-face)

       (,(concat "\\_<" (regexp-opt ns-defs) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-string-face)
       
       (,(concat "\\_<" (regexp-opt func-defs) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-function-name-face) 
       
       (,(concat "\\_<" (regexp-opt var-defs) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-variable-name-face)

       (,(concat "\\_<" (regexp-opt mutations) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-variable-name-face)
       ))))


(define-derived-mode elser-mode lisp-mode "Elser"
  "Major mode for Elser DSL."
  (setq font-lock-defaults elser-font-lock-keywords))
