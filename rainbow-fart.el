;;; rainbow-fart.el --- Playing audio when you typing -*- lexical-binding: t -*-

;; Author: Shi Tianshu
;; Package-Requires: ((emacs "26.3"))
;; Version: 1.0.0
;; URL: https://www.github.com/DogLooksGood/rainbow-fart.el
;;
;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; A port of https://github.com/SaekiRaku/vscode-rainbow-fart to Emacs.
;;
;; Requirements:
;; mpg123 is required for playing mp3 audio file.
;;
;; How to enable:
;; (rainbow-fart-mode 1)
;;
;; Voices located in voice directory of this project.

;;; Code:

(defvar rainbow-fart--playing nil)

(setq rainbow-fart--playing nil)

(setq rainbow-fart-voice-alist
      '(("if" . ("if_01.mp3" "if_02.mp3" "if_03.mp3"))
        ("defn" . ("function.mp3" "function_01.mp3" "function_02.mp3" "function_03.mp3"))
        ("fn" . ("function.mp3" "function_01.mp3" "function_02.mp3" "function_03.mp3"))
        ("for" . ("for_01.mp3" "for_02.mp3" "for_03.mp3"))
        (":require" . ("import_01.mp3" "import_02.mp3"))
        ("catch" . ("catch_01.mp3" "catch_02.mp3" "catch_03.mp3"))))

(defvar rainbow-fart-voice-path (concat (file-name-directory (or load-file-name buffer-file-name)) "voice/"))

(defun rainbow-fart--post-self-insert ()
  (unless rainbow-fart--playing
    (let* ((sym (thing-at-point 'symbol))
           (files (cdr (assoc sym rainbow-fart-voice-alist))))
      (when files
        (let* ((n (random (length files)))
               (file (nth n files)))
          (setq rainbow-fart--playing t)
          (let ((file-path (concat rainbow-fart-voice-path file)))
            (make-process :name "rainbow-fart-voice"
                          :command `("mpg123" ,file-path)
                          :sentinel (lambda (_ _) (setq rainbow-fart--playing nil)))))))))

(defun rainbow-fart--init ()
  (add-hook 'post-self-insert-hook #'rainbow-fart--post-self-insert t t))

(defun rainbow-fart--uninit ()
  (remove-hook 'post-self-insert-hook #'rainbow-fart--post-self-insert t))

(define-minor-mode rainbow-fart-mode
  "Play voice when you type keyword."
  nil
  "Fart"
  nil
  (if rainbow-fart-mode
      (rainbow-fart--init)
    (rainbow-fart--uninit)))

(provide 'rainbow-fart)
;;; rainbow-fart.el ends here
