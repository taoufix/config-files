; -*- Emacs-Lisp -*-

;; =============================================================================
;; tmp

(server-start)

;; unique filenames
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "/")
(setq uniquify-after-kill-buffer-p t) ; rename after killing uniquified
(setq uniquify-ignore-buffers-re "^\\*") ; don't muck with special buffers

;; =============================================================================
;; Emacs  behavior

;; I hate those backup files
;; I always end up removing real file when removing the backups
(setq make-backup-files nil)

;; UTF
(prefer-coding-system 'utf-8)

;; set the mouse paste to the point position and not the mouse position
(setq mouse-yank-at-point t)

;; typing "yes" or "no" is too much work, use "y" or "n"
(fset 'yes-or-no-p 'y-or-n-p)

;; turn wrapping on in horizontally-split windows
(setq truncate-partial-width-windows nil)

;; =============================================================================
;; Display

(setq inhibit-splash-screen t)

;; no tool bar
;(tool-bar-mode nil)

;; use color fonts
(global-font-lock-mode t)

;; color selection
(transient-mark-mode t)

;; use column numbers
(column-number-mode t)

;; no cursor blinking
(blink-cursor-mode nil)

;; show paren matches
(setq blink-matching-paren t)
(setq show-paren-delay 0)
(show-paren-mode t)

;; gentoo provided modes
(if (file-readable-p "/usr/share/emacs/site-lisp/site-gentoo.el")
    (progn
      (load "/usr/share/emacs/site-lisp/site-gentoo" nil t)

      ;; highlight current line
      (if window-system
        (progn
            (highline-mode t)
            (custom-set-faces
             '(highline-face ((t (:background "#111111")))))
            ;;(set-cursor-color "DarkMagenta")
            ));; if window-system
      ));; if gentoo

;; white space
(if (file-readable-p "~/.emacs.d/lisp/show-wspace.el")
    (progn
      (load "~/.emacs.d/lisp/show-wspace.el" nil t)
;;      (toggle-trailing-whitespace-font-lock)
      ;(toggle-tabs-font-lock)
))


;; =============================================================================
;; if using a graphical window (ie. not using -nw)

(if window-system
    (progn
      ;; don't show tooltips
      (if (or (and (> emacs-major-version 20)
                   (> emacs-minor-version 0))
              (> emacs-major-version 21))
          (tooltip-mode 0))

      ;; show entire file path in frame title
      (setq frame-title-format "Emacs - %f")

      ;; use mouse wheel to scroll
      (if (> emacs-major-version 20)
          (mouse-wheel-mode t))


      (mouse-avoidance-mode 'cat-and-mouse)
      (set-background-color "#1e2426")
      (set-foreground-color "white")
      ));; end if window-system


;; =============================================================================
;; kopiRight coding style

(setq auto-mode-alist (cons '("\\.ebuild$" . sh-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vf$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vp$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.vr$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.k$" . java-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\dbSchema" . sql-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\transDB" . sql-mode) auto-mode-alist))


(require 'cc-mode)
(defconst dms-c-style
  '((c-basic-offset . 2)
    (c-comment-only-line-offset . (0 . 0))
    ;; the following preserves Javadoc starter lines
    (c-hanging-comment-starter-p . nil)
    (c-offsets-alist . ((inline-open . 0)
                        (topmost-intro-cont    . +)
                        (statement-block-intro . +)
                        (knr-argdecl-intro     . 5)
                        (substatement-open     . +)
                        (label                 . 0)
                        (statement-case-open   . +)
                        (statement-cont        . +)
                        (arglist-intro  . c-lineup-arglist-intro-after-paren)
                        (arglist-close  . c-lineup-arglist)
                        (access-label   . 0)
                        (inher-cont     . c-lineup-java-inher)
                        (func-decl-cont . c-lineup-java-throws)
                        ))
    )
  "kopiRight C/Java Programming Style")

;; Customizations for all of c-mode, c++-mode, and objc-mode
(defun dms-c-mode-common-hook ()
  ;; add my personal style and set it for the current buffer
  (c-add-style "DMS" dms-c-style t)
  (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
        indent-tabs-mode nil)
  ;; we like hungry-delete but not auto-newline
  (c-toggle-hungry-state 1)
  ;; keybindings for C, C++, and Objective-C.  We can put these in
  ;; c-mode-map because c++-mode-map and objc-mode-map inherit it
  (define-key c-mode-map "\C-m" 'newline-and-indent))

(add-hook 'c-mode-common-hook 'dms-c-mode-common-hook)


;; =============================================================================

(defun 2white ()
  (interactive)
  (set-background-color "white")
  (set-foreground-color "black")
  (custom-set-faces
   '(highline-face ((t (:background "#eaeaea")))))
  )


;; java macros
(defun jprint ()
  (interactive)
  (indent-according-to-mode)
  (insert-string "System.out.println(\"\");")
  (backward-char)
  (backward-char)
  (backward-char)
  )

(defun jyellow ()
  (interactive)
  (indent-according-to-mode)
  (insert-string "System.out.println(\"[33;01m\" + + \"[00;00m\");")
  (backward-word)
  (backward-word)
  (backward-word)
  (backward-word)
  (forwarward-word)
  )

(defun jred ()
  (interactive)
  (indent-according-to-mode)
  (insert-string "System.out.println(\"[31;01m\" + + \"[00;00m\");")
  (backward-word)
  (backward-word)
  (backward-word)
  (backward-word)
  (forwarward-word)
  )

(defun jgreen ()
  (interactive)
  (indent-according-to-mode)
  (insert-string "System.out.println(\"[32;01m\" + + \"[00;00m\");")
  (backward-word)
  (backward-word)
  (backward-word)
  (backward-word)
  (forwarward-word)
  )

(defun jmain ()
  (interactive)
  (insert-string "public class Test {
  public static void main(String[] args) {

  }
}
")
  (previous-line)
  (previous-line)
  (previous-line)
  (indent-according-to-mode)
  )


;; shell macros
(defun pshellmode ()
  (interactive)
  (insert-string "# -*- Mode: Shell-Script -*-
")
  (shell-script-mode)
  )

(defun pconfmode ()
  (interactive)
  (insert-string "# -*- Mode: Config -*-
")
  (shell-script-mode)
  )


;; replace tab w/ space
(fset 'replace-next-tab-with-spaces
   [?\C-s ?\C-i ?\C-m left delete ?\M-i])

(fset 'replace-next-tab-with-spaces-cc-mode
   [?\C-s ?\C-i ?\C-m left delete ?\M-i ?\C-i])

;; not working
;(defun replace-next-tab-with-spaces ()
;  (interactive)
                                        ;  (search-forward "        ")
;  (delete-backward-char)
;  (tab-to-tab-stop)
;  )

;; insert a comment w/ time
(defun insert-comment ()
  (interactive)
  (comment-dwim "")
  (insert-string "!!! ")
  (insert-string (getenv "USER"))
  (insert (format-time-string " %Y%m%d:")))

(defun vjo-forward-current-word-keep-offset ()
  " (Vagn Johansen 1999)"
  (interactive)
  (let ((re-curword) (curword) (offset (point))
        (old-case-fold-search case-fold-search) )
    (setq curword (thing-at-point 'symbol))
    (setq re-curword (concat "\\<" (thing-at-point 'symbol) "\\>") )
    (beginning-of-thing 'symbol)
    (setq offset (- offset (point))) ; offset from start of symbol/word
    (setq offset (- (length curword) offset)) ; offset from end
    (forward-char)
    (setq case-fold-search nil)
    (if (re-search-forward re-curword nil t)
        (backward-char offset)
      ;; else
      (progn (goto-char (point-min))
             (if (re-search-forward re-curword nil t)
                 (progn (message "Searching from top. %s" (what-line))
                        (backward-char offset))
               ;; else
               (message "Searching from top: Not found"))
             ))
    (setq case-fold-search old-case-fold-search)
    ))

(defun vjo-backward-current-word-keep-offset ()
  " (Vagn Johansen 2002)"
  (interactive)
  (let ((re-curword) (curword) (offset (point))
        (old-case-fold-search case-fold-search) )
    (setq curword (thing-at-point 'symbol))
    (setq re-curword (concat "\\<" curword "\\>") )
    (beginning-of-thing 'symbol)
    (setq offset (- offset (point))) ; offset from start of symbol/word
    (forward-char)
    (setq case-fold-search nil)
    (if (re-search-backward re-curword nil t)
        (forward-char offset)
      ;; else
      (progn (goto-char (point-max))
             (if (re-search-backward re-curword nil t)
                 (progn (message "Searching from bottom. %s" (what-line))
                        (forward-char offset))
               ;; else
               (message "Searching from bottom: Not found"))
             ))
    (setq case-fold-search old-case-fold-search)
    ))



;; shortcuts for frequently used files
(defun .form ()
  (interactive)
  (find-file "~/work/svn/kopi/src/com/kopiright/vkopi/comp/form/Form.g"))

(defun .report ()
  (interactive)
  (find-file "~/work/svn/kopi/src/com/kopiright/vkopi/comp/report/Report.g"))

(defun .dbi ()
  (interactive)
  (find-file "~/work/svn/kopi/src/com/kopiright/xkopi/comp/dbi/Dbi.g"))

(defun .sqlc ()
  (interactive)
  (find-file "~/work/svn/kopi/src/com/kopiright/xkopi/comp/sqlc/Sqlc.g"))

(defun .emacs ()
  (interactive)
  (find-file "~/.emacs"))

(defun .bashrc ()
  (interactive)
  (find-file "~/.bashrc"))

;; =============================================================================
;; Shortcuts

; search the word under cursor
(global-set-key  '[f2] 'vjo-forward-current-word-keep-offset)
(global-set-key  '[(control f2)] 'vjo-backward-current-word-keep-offset)

; wrap a long argument function definition
(global-set-key '[f3]
                (lambda ()
                  (interactive)
                  (search-forward-regexp "[,)]")
                  (newline-and-indent)))

; replace tabs w/ spaces
(global-set-key '[f4] 'replace-next-tab-with-spaces-cc-mode) ; w/ indentation
(global-set-key '[(control f4)] 'replace-next-tab-with-spaces) ; w/o indentation


(global-set-key '[f5] 'goto-line)
(global-set-key '[f6] 'indent-region)
(global-set-key '[f7] 'sort-lines)
(global-set-key '[f8] 'ispell-region)
(global-set-key '[(control f8)] 'ispell)
(global-set-key '[f9] 'compile)
(global-set-key '[f10] 'highlight-changes-mode)
; de -> en : needs ~/bin/etrans
(fset 'translate
   [?\M-! ?e ?t ?r ?a ?n ?s ?  ?\C-y return])
(global-set-key '[f12] 'translate )

(global-set-key "\C-xv" 'insert-comment)
(global-set-key "\C-^"
                (lambda ()
                  (interactive)
                  (enlarge-window 3)))

;; =============================================================================
;; Obsolete

(defun vk-select ()
  (interactive)
  (insert-string "
    #cursor [] () {
            SELECT      
            FROM        
            WHERE       
            AND         
    } crs;
")
  )

(custom-set-faces
 '(font-lock-comment-face 
   ((((class color) (background dark)) (:foreground "Pink")) 
    (((class color)) (:foreground "FireBrick")))))

;;(global-set-key '[f1] (lambda () (interactive) (insert-string "SELECT ")))
;;(global-set-key '[f2] (lambda () (interactive) (insert-string "FROM ")))
;;(global-set-key '[f3] (lambda () (interactive) (insert-string "WHERE ")))
