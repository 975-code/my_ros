;; Auto-generated. Do not edit!


(when (boundp 'mytopic::topic)
  (if (not (find-package "MYTOPIC"))
    (make-package "MYTOPIC"))
  (shadow 'topic (find-package "MYTOPIC")))
(unless (find-package "MYTOPIC::TOPIC")
  (make-package "MYTOPIC::TOPIC"))

(in-package "ROS")
;;//! \htmlinclude topic.msg.html


(defclass mytopic::topic
  :super ros::object
  :slots (_num _name ))

(defmethod mytopic::topic
  (:init
   (&key
    ((:num __num) 0)
    ((:name __name) "")
    )
   (send-super :init)
   (setq _num (round __num))
   (setq _name (string __name))
   self)
  (:num
   (&optional __num)
   (if __num (setq _num __num)) _num)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; int8 _num
    1
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _num
       (write-byte _num s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _num
     (setq _num (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _num 127) (setq _num (- _num 256)))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get mytopic::topic :md5sum-) "f785c826e41711e21d8e2636b4f53cde")
(setf (get mytopic::topic :datatype-) "mytopic/topic")
(setf (get mytopic::topic :definition-)
      "int8 num
string name
")



(provide :mytopic/topic "f785c826e41711e21d8e2636b4f53cde")


