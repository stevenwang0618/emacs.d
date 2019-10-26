;;; init-local --- user configuration
;;; Commentary:
;;;------------------------------------------------------------------------

;; setting font for mac system
;;;------------------------------------------------------------------------
;; Setting English Font
(set-face-attribute
 'default nil :font "Source Code Pro 14")
;; Chinese Font 配制中文字体
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "Microsoft YaHei" :size 14)))
;; Note: you can change "Kaiti SC" to "Microsoft YaHei" or other fonts

;; Add markdown export choice in org-mode
(setq org-export-backends (quote (ascii html icalendar latex md)))


;; Run SageMath by M-x run-sage instead of M-x sage-shell:run-sage
;; (sage-shell:define-alias)

;; Turn on eldoc-mode in Sage terminal and in Sage source files
;; (add-hook 'sage-shell-mode-hook #'eldoc-mode)
;; (add-hook 'sage-shell:sage-mode-hook #'eldoc-mode)

;; org-mode 设置快捷键
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)

;; org-mode 自动换行
;; (add-hook 'org-mode-hook
;;           (lambda()
;;             (setq truncate-lines nil)))
;; 或者使用如下命令
(global-visual-line-mode 1) ; 1 for on, 0 for off.

;; 设置org-mode capture file for notes
;;(setq org-directory "~/notes")
;;(setq org-default-notes-file (concat org-directory "/inbox.org"))

;; 为md设置pandoc 路径
(setq markdown-command "/usr/local/bin/pandoc")


;; auctex 设置
;; configure auctex compile command to xelatex
;; (setq TeX-output-view-style (quote (("^pdf$" "." "evince %o %(outpage)"))))
(add-hook 'LaTeX-mode-hook (lambda()
                             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                             (setq TeX-command-default "XeLaTeX")
                             (setq TeX-save-query  nil )
                             (setq TeX-show-compilation t)
                             ))

;; (latex-preview-pane-enable)
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)
;;(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;;(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;;(setq reftex-plug-into-AUCTeX t)


;; 使用 yasnippet 设置文件模板
;;(use-package yasnippet
;;  :ensure t
;;  :init
;;  (yas-global-mode 1)
;;  :config
;;  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))
(provide 'init-local)
