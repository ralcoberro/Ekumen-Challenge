; Auto-generated. Do not edit!


(cl:in-package ekumen_exe1-srv)


;//! \htmlinclude Recording-request.msg.html

(cl:defclass <Recording-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:integer
    :initform 0))
)

(cl:defclass Recording-request (<Recording-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Recording-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Recording-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ekumen_exe1-srv:<Recording-request> is deprecated: use ekumen_exe1-srv:Recording-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <Recording-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekumen_exe1-srv:command-val is deprecated.  Use ekumen_exe1-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Recording-request>) ostream)
  "Serializes a message object of type '<Recording-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Recording-request>) istream)
  "Deserializes a message object of type '<Recording-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Recording-request>)))
  "Returns string type for a service object of type '<Recording-request>"
  "ekumen_exe1/RecordingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Recording-request)))
  "Returns string type for a service object of type 'Recording-request"
  "ekumen_exe1/RecordingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Recording-request>)))
  "Returns md5sum for a message object of type '<Recording-request>"
  "694091dc244da4b236b12351f9f53c99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Recording-request)))
  "Returns md5sum for a message object of type 'Recording-request"
  "694091dc244da4b236b12351f9f53c99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Recording-request>)))
  "Returns full string definition for message of type '<Recording-request>"
  (cl:format cl:nil "int64 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Recording-request)))
  "Returns full string definition for message of type 'Recording-request"
  (cl:format cl:nil "int64 command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Recording-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Recording-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Recording-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude Recording-response.msg.html

(cl:defclass <Recording-response> (roslisp-msg-protocol:ros-message)
  ((ret
    :reader ret
    :initarg :ret
    :type cl:integer
    :initform 0))
)

(cl:defclass Recording-response (<Recording-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Recording-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Recording-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ekumen_exe1-srv:<Recording-response> is deprecated: use ekumen_exe1-srv:Recording-response instead.")))

(cl:ensure-generic-function 'ret-val :lambda-list '(m))
(cl:defmethod ret-val ((m <Recording-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekumen_exe1-srv:ret-val is deprecated.  Use ekumen_exe1-srv:ret instead.")
  (ret m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Recording-response>) ostream)
  "Serializes a message object of type '<Recording-response>"
  (cl:let* ((signed (cl:slot-value msg 'ret)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Recording-response>) istream)
  "Deserializes a message object of type '<Recording-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ret) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Recording-response>)))
  "Returns string type for a service object of type '<Recording-response>"
  "ekumen_exe1/RecordingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Recording-response)))
  "Returns string type for a service object of type 'Recording-response"
  "ekumen_exe1/RecordingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Recording-response>)))
  "Returns md5sum for a message object of type '<Recording-response>"
  "694091dc244da4b236b12351f9f53c99")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Recording-response)))
  "Returns md5sum for a message object of type 'Recording-response"
  "694091dc244da4b236b12351f9f53c99")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Recording-response>)))
  "Returns full string definition for message of type '<Recording-response>"
  (cl:format cl:nil "int64 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Recording-response)))
  "Returns full string definition for message of type 'Recording-response"
  (cl:format cl:nil "int64 ret~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Recording-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Recording-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Recording-response
    (cl:cons ':ret (ret msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Recording)))
  'Recording-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Recording)))
  'Recording-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Recording)))
  "Returns string type for a service object of type '<Recording>"
  "ekumen_exe1/Recording")