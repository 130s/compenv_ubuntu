;from cns.sfc/2005/sep/27
; Coloring window
(cond
 ((and window-system (string-match "^19" emacs-version))
  (require 'hilit19)))

(setq mh-letter-mode-hook
      (function
         (lambda ()
(setq mh-ins-buf-prefix ">")
(setq mh-yank-from-start-of-msg 'body)
(turn-on-auto-fill))))

;;; Launch lisp
;;
;;  NL1
;;

;(setq inferior-lisp-program "gcl")
;
;(setq default-kanji-process-code 3)
;
;(defun save-buffer-euc ()
;  (interactive)
;  (let ((lisp-mode "lisp-mode")
;	(mode major-mode))
;    (if (string= mode lisp-mode)
;	(progn (setq kanji-fileio-code 3)
;	       (save-buffer)
;	       (message "Save buffer in EUC.")
;	       (setq kanji-fileio-code 1)
;	       (change-fileio-code)))))

;(define-key lisp-mode-map "\C-x\C-s" 'save-buffer-euc)

;(setq auto-mode-alist (cons '("\\.dic$" . lisp-mode)
;			    (cons '("\\.grm$" . lisp-mode) auto-mode-alist)))

;for GCL use
;(setq inferior-lisp-program "gcl")

;;Swap \C-h on delete-backward-char
;(load-library "term/keyswap")
;(if (eq window-system 'x)
;    (progn
;      (define-keyfunction-key-map [delete] [8])
;      (put 'delete 'ascii-character 8)))
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;ime/2005/oct/15
;(global-set-key "\C-o" 'mw32-ime-toggle)

;2005/nov/10/setting color
;http://home.att.ne.jp/alpha/z123/elisp-j.html
(if window-system (progn

  ;; text color
  (set-foreground-color "aquamarine")
  ;; background color
  (set-background-color "DarkGreen")
;;;  (set-background-color "gold4")
;;;  (set-background-color "DarkSlateGrey")
;;;  (set-background-color "SlateBlue")
  ;; mode line color
  ;(set-face-foreground 'modeline "white") ;3/8/14 Seems invalid on win8?
  ;; mode line background color
  ;(set-face-background 'modeline "MediumPurple2") ;3/8/14 Seems invalid on win8?
  ;; cursor color
  (set-cursor-color "MediumPurple2")
  ;; mouse pointer color
  (set-mouse-color  "MediumPurple2")
))

;; For folding a line by specified number of characters
(add-hook 'text-mode-hook
          '(lambda ()
             (setq fill-column 78)
;             (auto-fill-mode 1)
             ))

; window size upon boot
; 10/23/2012 delegated to each machine's setting file.
;;(set-frame-height (selected-frame) 44)
;;(set-frame-width (selected-frame) 94)

;; 5/31/2011 Word Count.   ONLY for Mac???
;; http://blog.lilyx.net/2007/10/02/emacs-word-count-mode/
;(setq load-path (cons (expand-file-name "/Applications/Emacs_Carbon/") load-path))
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

; 3/15/2012/For ignoring cases. As of today these are not in effect.
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

; 4/1/2012/ROS setting is exported
;;(load "~/ROS_Workspace/Shared_MultiHosts_ROS_Workspace/.emacs_ros") ; 7/3/2012/This is now referred from ~/.emacs

;; Creating short cut
(set-register ?d '(file . "~/data/Dropbox/GoogleDrive/gm130s_other/Periodic/GooglePhotos/2016/"))
(set-register ?s '(file . "~/data/Dropbox/app/Synergy/"))
(set-register ?t '(file . "~/link/TORK"))

;; 10/30/2015 http://superuser.com/questions/255475/emacs-setting-column-mode-to-be-always-on
(setq column-number-mode t)
