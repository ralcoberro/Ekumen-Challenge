
(cl:in-package :asdf)

(defsystem "ekumen_exe1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Num" :depends-on ("_package_Num"))
    (:file "_package_Num" :depends-on ("_package"))
    (:file "Path_pos" :depends-on ("_package_Path_pos"))
    (:file "_package_Path_pos" :depends-on ("_package"))
    (:file "Recording" :depends-on ("_package_Recording"))
    (:file "_package_Recording" :depends-on ("_package"))
  ))