; Cria uma matriz 6,6 populada por zeros
(defparameter board (make-array '(6 6) :initial-element 0))

;Função que irá checar as condições para colocar um número no espaço 
(defun possible (i j n board)
    (and (possibleI i board (populate-list-row i board (make-array 6 :inital-element 0))) (possibleJ j n board))
)

(defun create-list(size)
    ()
)

(defun populate-list-row(i board list)
    (loop for a in '(0 1 2 3 4 5)
        do ((set (aref board i a)))

    )
)

(defun populate-list-column(j board list)
    (loop for a in '(0 1 2 3 4 5)
        do ((set (aref board a j)))

    )
)

(defun possibleCheck (n board list)
    (find n list)
)

;; (defun possibleI (n board list)
;;     (find 2 (vector 1 2 3 4))
;; )


(defun str8s-solver (board)
    (loop for i in '(0 1 2 3 4 5)
        do (loop for j in '(0 1 2 3 4 5)
            do (if (= (aref board i j) 0)
                (loop for n in '(0 1 2 3 4 5)
                    do (if (possible i j n board)
                        (progn
                            (setf (aref board i j) (+ n 1))
                        )
                    )
                )
            )
        )
    )
)


(defun main()
    (str8s-solver board)
    (write-line (write-to-string (possible 0 0 1 board)))
    (write-line (write-to-string board))
)
(main)



;Função que irá checar a coluna
;; (defun possibleI (i n board)
;;     (loop for a in '(0 1 2 3 4 5)
;;         do (if (= (aref board i a) n)
;;             NIL
;;             T
;;         )
;;     )
;; )

;Função que irá checar a linha
;; (defun possibleJ (j n board)
;;     (loop for a in '(0 1 2 3 4 5)
;;         do (if (= (aref board a j) n)
;;             NIL
;;             T
;;         )
;;     )
;; )


; (find n (aref board j n))