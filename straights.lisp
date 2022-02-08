
(defparameter board (make-array '(6 6) :initial-element 0))

(defun possible (i j n board)
    (+ 0 1)
)

(defun str8s-solver (board)
    (loop for i in '(0 1 2 3 4 5)
        do (loop for j in '(0 1 2 3 4 5)
            do (if (= (aref board i j) 0)
                (loop for n in '(0 1 2 3 4 5)
                    do (if (= (possible i j n board) 1)
                        (progn
                            (setf (aref board i j) n)
                        )
                    )
                )
            )
        )
    )
)


(defun main()
    (str8s-solver board)
    (write (write-to-string board))
)
(main)