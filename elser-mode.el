;;; elser-mode.el --- major mode for elser  -*- lexical-binding: t; -*-

;; Author: дрон
;; Version: 0.0.1
;; Keywords: languages, elser
;; URL: https://github.com/elser-lang/elser-mode

;;; Code:

(defgroup elser-mode nil
  "Major mode for Elser language."
  :prefix "elser-"
  :group 'languages
  :link '(url-link :tag "Github" "https://github.com/elser-lang/elser-mode"))

(defconst elser-font-lock-keywords
  (let* (
	 
         (structure '("constructor" "storage" "constants" "events" "functions"))
	 (ns-defs '("ns"))
	 
         (visibility '(":external" ":internal" "mut"))	 
	 
         (builtins '("sto" "require" "do" "let" "loop" "revert" "timestamp"
		     "self" "callvalue" "caller" "origin" "balance"
		     "assert" "->" "while" "addr.zero" "if"))

	 (return-bind '("->"))
	 
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
       (,(concat "\\_<" (regexp-opt visibility) "\\_>") . font-lock-builtin-face)
       
       ;; Built-in functions.
       (,(concat "\\_<" (regexp-opt builtins) "\\_>") . font-lock-keyword-face)
       (,(regexp-opt return-bind) . font-lock-keyword-face)
       (,(concat "\\_<" (regexp-opt func-defs) "\\_>") . font-lock-keyword-face)
       (,(concat "\\_<" (regexp-opt var-defs) "\\_>") . font-lock-keyword-face)
       (,(regexp-opt mutations) . font-lock-warning-face)
       
       ;; Simple types.
       (,(regexp-opt simple-types) . font-lock-type-face)
       
       ;; Complex types.
       (,(regexp-opt complex-types 'words) . font-lock-type-face)

       (,(concat "\\_<" (regexp-opt var-defs) "\\_>"
		 "\\s-*" 
		 "\\(\\_<\\(?:\\sw\\|\\s_\\)+\\_>\\)")
	1 font-lock-variable-name-face)       

       (,(concat "\\_<" (regexp-opt ns-defs) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-string-face)
       
       (,(concat "\\_<" (regexp-opt func-defs) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-function-name-face)      

       (,(concat "\\_<" (regexp-opt return-bind) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-variable-name-face)

       (,(concat "\\_<" (regexp-opt mutations) "\\_>\\s-+\\(\\sw+\\)")
	1 font-lock-variable-name-face)
       ))))

;;;###autoload
(define-derived-mode elser-mode lisp-mode "Elser"
  "Major mode for Elser DSL."
  (setq font-lock-defaults elser-font-lock-keywords))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.els" . elser-mode))

(provide 'elser-mode)
;;; elser-mode.el ends here
