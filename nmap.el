;;; nmap.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Umut Gercek
;;
;; Author: Umut Gercek <https://github.com/umut>
;; Maintainer: Umut Gercek <umutgercek1999@gmail.com>
;; Created: Nisan 15, 2021
;; Modified: Nisan 15, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/EminUmutGercek/nmap.el
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:


(setq nmap-highlights
      '(("[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" . font-lock-variable-name-face) ;; ip4
        ("[0-9]+" . font-lock-constant-face);; port
        ("nmap" . font-lock-builtin-face)))

(define-derived-mode nmap-mode fundamental-mode "nmap"
  "Onyl syntax higlight for nmap"
  (setq font-lock-defaults '(nmap-highlights)))

(provide 'nmap)
;;; nmap.el ends here
