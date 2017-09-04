; Auto-generated. Do not edit!


(cl:in-package ekumen_exe1-msg)


;//! \htmlinclude Path_pos.msg.html

(cl:defclass <Path_pos> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass Path_pos (<Path_pos>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Path_pos>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Path_pos)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ekumen_exe1-msg:<Path_pos> is deprecated: use ekumen_exe1-msg:Path_pos instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Path_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekumen_exe1-msg:x-val is deprecated.  Use ekumen_exe1-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Path_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekumen_exe1-msg:y-val is deprecated.  Use ekumen_exe1-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <Path_pos>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ekumen_exe1-msg:angle-val is deprecated.  Use ekumen_exe1-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Path_pos>) ostream)
  "Serializes a message object of type '<Path_pos>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Path_pos>) istream)
  "Deserializes a message object of type '<Path_pos>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Path_pos>)))
  "Returns string type for a message object of type '<Path_pos>"
  "ekumen_exe1/Path_pos")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Path_pos)))
  "Returns string type for a message object of type 'Path_pos"
  "ekumen_exe1/Path_pos")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Path_pos>)))
  "Returns md5sum for a message object of type '<Path_pos>"
  "39617ea5ffa910b78cdf07b659b77ce4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Path_pos)))
  "Returns md5sum for a message object of type 'Path_pos"
  "39617ea5ffa910b78cdf07b659b77ce4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Path_pos>)))
  "Returns full string definition for message of type '<Path_pos>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Path_pos)))
  "Returns full string definition for message of type 'Path_pos"
  (cl:format cl:nil "float32 x~%float32 y~%float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Path_pos>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Path_pos>))
  "Converts a ROS message object to a list"
  (cl:list 'Path_pos
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':angle (angle msg))
))
