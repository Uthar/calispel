;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp -*-

(defsystem "calispel"
  :version "0.1"
  :maintainer "J.P. Larocque"
  :author "J.P. Larocque, et al. (see COPYRIGHT.txt)"
  :licence "ISC-style and other permissive (see COPYRIGHT.txt)"
  :description "Thread-safe message-passing channels, in the style of
the occam programming language."
  :components (;; Core data structures and algorithms.
	       (:file "core"
                :depends-on ("null-queue"
			     "package"))
	       ;; Basic operations: ? and !
	       (:file "basic"
		:depends-on ("core"
			     "package"))
	       ;; The *-ALT macros.
	       (:file "alt"
		:depends-on ("core"
			     "package"))
	       ;; The null queue.
	       (:file "null-queue"
                :depends-on ("package"))
               (:file "package"))
;;	       Package definition.
  :depends-on ("jpl-queues"
	       "bordeaux-threads"
	       (:version "jpl-util" "0.2"))
  :in-order-to ((test-op (test-op "calispel/test"))))

(defsystem "calispel/test"
  :version "0.1"
  :maintainer "Rick Venn (richard.venn@gmail.com)"
  :author "J.P. Larocque, et al. (see COPYRIGHT.txt)"
  :licence "ISC-style and other permissive (see COPYRIGHT.txt)"
  :description "Test suite for Calispel"
  :depends-on (:calispel :eager-future2)
  :components ((:file "test"))
  :perform (test-op (o c)
             (symbol-call :calispel-test :test-concurrency :verbose-p t)))
