;;; idris-tests.el --- Tests for idris-mode  -*- lexical-binding: t -*-

;; Copyright (C) 2014  David Raymond Christiansen

;; Author: David Raymond Christiansen <drc@itu.dk>
;; Keywords: languages

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This is a collection of simple tests for idris-mode.

;;; Code:

(require 'idris-mode)
(require 'idris-ipkg-mode)

(ert-deftest trivial-test ()
  (should t))


;; Test the metavariable-list-on-load setting
(ert-deftest idris-test-metavar-load ()
  (idris-quit)
  ;;; The default setting should be to show metavariables
  (should idris-metavariable-show-on-load)

  (let ((buffer (find-file "test-data/MetavarTest.idr")))
    ;;; Check that the file was loaded
    (should (bufferp buffer))

    ;;; Check that it shows the metavar list with the option turned on
    (with-current-buffer buffer
      (idris-load-file))
    ;;; Allow async stuff to happen
    (dotimes (_ 5) (accept-process-output nil 1))
    (let ((mv-buffer (get-buffer idris-metavariable-list-buffer-name)))
      ;; The buffer exists and contains characters
      (should (bufferp mv-buffer))
      (should (> (buffer-size mv-buffer) 10)))
    (idris-quit)

    ;; Now check that it works with the setting the other way
     (let ((idris-metavariable-show-on-load nil))
       (with-current-buffer buffer
         (idris-load-file))
       (dotimes (_ 5) (accept-process-output nil 1))
       (let ((mv-buffer (get-buffer idris-metavariable-list-buffer-name)))
         (should-not (bufferp mv-buffer))
         (should (null mv-buffer))))
    ;; Clean up
    (kill-buffer))

  ;; More cleanup
  (idris-quit))


(provide 'idris-tests)
;;; idris-tests.el ends here
