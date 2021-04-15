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

(defconst ip4-regex "\\([0-9]\\{1,3\\}\.\\)\\{3\\}[0-9]\\{1,3\\}")
               ;; \([0-9] \{1,3 \}\. \) \{3 \}[0-9] \{1,3 \}
               ;;  ([0-9]  {1,3}   .  )  {3}  [0-9]{1,3}
               ;;  ([0-9]{1,3}.){3}[0-9]{1,3}

(defconst ip6-regex "\\([0-9a-fA-F]\\{1,4\\}:\\)\\{7\\}[0-9a-fA-F]\\{1,4\\}")
               ;; \([0-9a-fA-F] \{1,4 \}: \) \{7 \}[0-9a-fA-F] \{1,4 \}
               ;;  ([0-9a-fA-F]  {1,4  }:  )  {7  }[0-9a-fA-F]   {1,4 }
               ;;  ([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}

(defconst ips (concat ip4-regex "\\|" ip6-regex)) ;; ip4 or ip6

(setq nmap-highlights
      `((,ips . font-lock-variable-name-face)
        ("[0-9]\\{1,5\\}" . font-lock-constant-face)
        ("nmap" . font-lock-comment-face)))

(define-derived-mode nmap-mode fundamental-mode "nmap"
  "Onyl syntax higlight for nmap"
  (setq font-lock-defaults '(nmap-highlights)))

(provide 'nmap)
;;; nmap.el ends here
