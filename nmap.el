;;; nmap.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Umut Gercek
;;
;; Author: Umut Gercek <https://github.com/umut>
;; Maintainer: Umut Gercek <umutgercek1999@gmail.com>
;; Created: Nisan 15, 2021
;; Modified: Nisan 15, 2021
;; Version: 0.0.1
;; Version 0.0.1
;; Keywords:
;; Homepage: https://github.com/EminUmutGercek/nmap.el
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(require 'rx)

(defconst ip4-regex "\\([0-9]\\{1,3\\}\\.\\)\\{3\\}[0-9]\\{1,3\\}\\(/[0-9]\\{1,3\\}\\)?")

(defconst ip6-regex "\\([0-9A-Fa-f]\\{1,4\\}:\\)\\{7\\}[0-9A-Fa-f]\\{1,4\\}\\(/[0-9]\\{1,3\\}\\)?")

(defconst ips-regex (concat ip4-regex "\\|" ip6-regex "\\|" "<ip>")) ;; ip4 or ip6

(defconst domain-regex (concat "[a-zA-Z][-a-zA-Z\.]+" "\\|" "<domain>"))

(defconst target-regex (concat ips-regex "\\|" ips-regex))

(defconst -p-no* "-p [[:digit:]]+\\(-[[:digit:]]+\\)?")

(defconst port-regex 
  (rx
   (or
    "<port>"
   (seq
   "-p"
   (opt space)
   (or
    "-"
    (seq
     (group (1+ digit))
     (opt space)
     (opt
      (seq
       "-"
       (opt space)
       (group (1+ digit))))))))))

(defconst time-regex (concat "-T[0-5]" "\\|" "<time>"))

(setq nmap-highlights
      `((,target-regex . font-lock-variable-name-face)
        (,port-regex   . font-lock-keyword-face)
        (,time-regex   . font-lock-warning-face)
        ("[0-9]+"      . font-lock-constant-face)
        ("nmap"        . font-lock-builtin-face)))

(define-derived-mode nmap-mode fundamental-mode "nmap"
  "Onyl syntax higlight for nmap"
  (setq font-lock-defaults '(nmap-highlights)))

(provide 'nmap)
;;; nmap.el ends here
