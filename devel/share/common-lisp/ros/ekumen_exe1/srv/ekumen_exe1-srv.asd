
(cl:in-package :asdf)

(defsystem "ekumen_exe1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Recording" :depends-on ("_package_Recording"))
    (:file "_package_Recording" :depends-on ("_package"))
    (:file "Recording_v1" :depends-on ("_package_Recording_v1"))
    (:file "_package_Recording_v1" :depends-on ("_package"))
  ))