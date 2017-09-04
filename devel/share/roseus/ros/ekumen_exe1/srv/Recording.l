;; Auto-generated. Do not edit!


(when (boundp 'ekumen_exe1::Recording)
  (if (not (find-package "EKUMEN_EXE1"))
    (make-package "EKUMEN_EXE1"))
  (shadow 'Recording (find-package "EKUMEN_EXE1")))
(unless (find-package "EKUMEN_EXE1::RECORDING")
  (make-package "EKUMEN_EXE1::RECORDING"))
(unless (find-package "EKUMEN_EXE1::RECORDINGREQUEST")
  (make-package "EKUMEN_EXE1::RECORDINGREQUEST"))
(unless (find-package "EKUMEN_EXE1::RECORDINGRESPONSE")
  (make-package "EKUMEN_EXE1::RECORDINGRESPONSE"))

(in-package "ROS")





(defclass ekumen_exe1::RecordingRequest
  :super ros::object
  :slots (_command ))

(defmethod ekumen_exe1::RecordingRequest
  (:init
   (&key
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; int64 _command
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _command
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _command (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _command) (= (length (_command . bv)) 2)) ;; bignum
              (write-long (ash (elt (_command . bv) 0) 0) s)
              (write-long (ash (elt (_command . bv) 1) -1) s))
             ((and (class _command) (= (length (_command . bv)) 1)) ;; big1
              (write-long (elt (_command . bv) 0) s)
              (write-long (if (>= _command 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _command s)(write-long (if (>= _command 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _command
#+(or :alpha :irix6 :x86_64)
      (setf _command (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _command (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass ekumen_exe1::RecordingResponse
  :super ros::object
  :slots (_ret ))

(defmethod ekumen_exe1::RecordingResponse
  (:init
   (&key
    ((:ret __ret) 0)
    )
   (send-super :init)
   (setq _ret (round __ret))
   self)
  (:ret
   (&optional __ret)
   (if __ret (setq _ret __ret)) _ret)
  (:serialization-length
   ()
   (+
    ;; int64 _ret
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _ret
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ret (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ret) (= (length (_ret . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ret . bv) 0) 0) s)
              (write-long (ash (elt (_ret . bv) 1) -1) s))
             ((and (class _ret) (= (length (_ret . bv)) 1)) ;; big1
              (write-long (elt (_ret . bv) 0) s)
              (write-long (if (>= _ret 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ret s)(write-long (if (>= _ret 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _ret
#+(or :alpha :irix6 :x86_64)
      (setf _ret (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ret (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass ekumen_exe1::Recording
  :super ros::object
  :slots ())

(setf (get ekumen_exe1::Recording :md5sum-) "694091dc244da4b236b12351f9f53c99")
(setf (get ekumen_exe1::Recording :datatype-) "ekumen_exe1/Recording")
(setf (get ekumen_exe1::Recording :request) ekumen_exe1::RecordingRequest)
(setf (get ekumen_exe1::Recording :response) ekumen_exe1::RecordingResponse)

(defmethod ekumen_exe1::RecordingRequest
  (:response () (instance ekumen_exe1::RecordingResponse :init)))

(setf (get ekumen_exe1::RecordingRequest :md5sum-) "694091dc244da4b236b12351f9f53c99")
(setf (get ekumen_exe1::RecordingRequest :datatype-) "ekumen_exe1/RecordingRequest")
(setf (get ekumen_exe1::RecordingRequest :definition-)
      "int64 command
---
int64 ret

")

(setf (get ekumen_exe1::RecordingResponse :md5sum-) "694091dc244da4b236b12351f9f53c99")
(setf (get ekumen_exe1::RecordingResponse :datatype-) "ekumen_exe1/RecordingResponse")
(setf (get ekumen_exe1::RecordingResponse :definition-)
      "int64 command
---
int64 ret

")



(provide :ekumen_exe1/Recording "694091dc244da4b236b12351f9f53c99")


