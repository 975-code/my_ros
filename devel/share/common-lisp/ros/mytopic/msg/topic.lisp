; Auto-generated. Do not edit!


(cl:in-package mytopic-msg)


;//! \htmlinclude topic.msg.html

(cl:defclass <topic> (roslisp-msg-protocol:ros-message)
  ((num
    :reader num
    :initarg :num
    :type cl:fixnum
    :initform 0)
   (name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass topic (<topic>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <topic>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'topic)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mytopic-msg:<topic> is deprecated: use mytopic-msg:topic instead.")))

(cl:ensure-generic-function 'num-val :lambda-list '(m))
(cl:defmethod num-val ((m <topic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mytopic-msg:num-val is deprecated.  Use mytopic-msg:num instead.")
  (num m))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <topic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mytopic-msg:name-val is deprecated.  Use mytopic-msg:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <topic>) ostream)
  "Serializes a message object of type '<topic>"
  (cl:let* ((signed (cl:slot-value msg 'num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <topic>) istream)
  "Deserializes a message object of type '<topic>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'num) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<topic>)))
  "Returns string type for a message object of type '<topic>"
  "mytopic/topic")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'topic)))
  "Returns string type for a message object of type 'topic"
  "mytopic/topic")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<topic>)))
  "Returns md5sum for a message object of type '<topic>"
  "f785c826e41711e21d8e2636b4f53cde")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'topic)))
  "Returns md5sum for a message object of type 'topic"
  "f785c826e41711e21d8e2636b4f53cde")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<topic>)))
  "Returns full string definition for message of type '<topic>"
  (cl:format cl:nil "int8 num~%string name~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'topic)))
  "Returns full string definition for message of type 'topic"
  (cl:format cl:nil "int8 num~%string name~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <topic>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <topic>))
  "Converts a ROS message object to a list"
  (cl:list 'topic
    (cl:cons ':num (num msg))
    (cl:cons ':name (name msg))
))
