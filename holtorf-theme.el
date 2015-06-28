;;; holtorf-theme.el --- custom light color theme for Emacs24

;; Copyright (C) 2015 Sascha Raabe

;; Authors: Sascha Raabe <sascha_develop@gmx.org>

;; TODO: !!! LICENSE !!!

;;; Code:

(deftheme holtorf
  "Light theme colors for Emacs24")

(defvar holtorf-colors-alist
  '(("holtorf-bg" . "#FFFFED")
    ("holtorf-fg" . "#000000")
    ("holtorf-highlight" . "#F0FAFF")
    ("holtorf-region" . "#BFE9FF")
    
    ("holtorf-modeline-blue" . "#1F8DD6")

    ("holtorf-blue" . "#006FE0")
    ("holtorf-blue+1" . "#0000FF")
    ("holtorf-box" . "#1A2F54")
    ("holtorf-red" . "#CC0000")
    ("holtorf-red+1" . "#FF8080")
    ("holtorf-grey" . "#F0F0EF")
    ("holtorf-grey-1" . "#9B9C97")
    ("holtorf-grey-2" . "#808080")
    ("holtorf-green" . "#008000"))
    
  "Colors used in holtorf-theme (alist)")

(defmacro holtorf-with-color-variables (&rest body)
  "`let' bind all colors defined in `holtorf-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   holtorf-colors-alist))
     ,@body))

(holtorf-with-color-variables
  (custom-theme-set-faces
   'holtorf

   ;; ***** Defaults *****
   '(button ((t (:underline t))))
   `(default ((t (:foreground ,holtorf-fg :background ,holtorf-bg))))
   `(mode-line ((t :box (:line-width 1 :color ,holtorf-box)
                   :foreground ,holtorf-bg
                   :background ,holtorf-modeline-blue
                   :width condensed)))
   `(mode-line-inactive ((t :box (:line-width 1 :color ,holtorf-box)
                            :foreground ,holtorf-fg
                            :background ,holtorf-grey
                            :width condensed)))
   `(mode-line-buffer-id ((,class (:weight bold :background ,holtorf-box))))
   `(highlight ((,class (:background ,holtorf-highlight))))
   `(region ((,class (:background ,holtorf-region))))

   ;; ***** Basic Syntax Highlightning ******
   `(font-lock-builtin-face ((,class (:foreground ,holtorf-blue))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,holtorf-grey-2)))) 
   `(font-lock-comment-face ((,class (:foreground ,holtorf-grey-2)))) 
   `(font-lock-constant-face ((,class (:foreground ,holtorf-red))))
   `(font-lock-doc-face ((,class (:foreground ,holtorf-green))))
   `(font-lock-function-name-face ((,class (:weight normal :foreground ,holtorf-blue+1))))
   `(font-lock-keyword-face ((,class (:bold t :foreground ,holtorf-blue+1)))) ; 
   `(font-lock-preprocessor-face ((,class (:foreground ,holtorf-grey-2))))
   `(font-lock-regexp-grouping-backslash ((,class (:weight bold :inherit nil))))
   `(font-lock-regexp-grouping-construct ((,class (:weight bold :inherit nil))))
   `(font-lock-string-face ((,class (:foreground ,holtorf-red))))
   `(font-lock-type-face ((,class (:weight normal :foreground ,holtorf-blue+1))))
   `(font-lock-variable-name-face ((,class (:weight normal :foreground ,holtorf-red)))) ; 

   ;; ***** ido mode ******
   `(ido-subdir ((,class (:foreground ,holtorf-fg :weight bold)))) 
   `(ido-first-match ((,class (:weight bold :underline  ,holtorf-region :foreground nil :background ,holtorf-region)))) 
   `(ido-only-match ((,class (:foreground  ,holtorf-region)))) 
   `(ido-indicator ((,class (:foreground ,holtorf-highlight)))) 
   

   
   ))

(provide-theme 'holtorf)

;;; holtorf-theme.el ends here
