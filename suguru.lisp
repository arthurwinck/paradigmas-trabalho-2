
; Criação do ponto, que possui o seu valor e sua região
(defstruct ponto
    r ;região
    v ;valor
)
; Criar um ponto: (make-ponto :r regiao :v valor)

; A coordenada para acessar a matriz
(defstruct coordenada
    i
    j
)

; Retorna a região do ponto em específico
(defun getR(p)
    (ponto-r p)
)

; Retorna o valor do ponto do tabuleiro
(defun getV(p)
    (ponto-v p)
)

; Checa se as coordenadas de um ponto são válidos, se forem retorna o seu ponto, se não retorna uma coordenada inválida 
(defun getP(p matriz)
    (if (and (or (< (coordenada-i c) 0) (> (coordenada-i c) (- (length (matriz)) 1))) (or (< (coordenada-j c) 0) (> (coordenada-j c) (- (length (nth 0 matriz)) 1))))
        (make-ponto :r -1 :v -1)
        (nth coordenada-j c (nth coordenada-i c matriz))
    )
)

; Seta um elemento em uma linha (lista). É usado em conjunto com setaLista para setar uma posição em específico da matriz
(defun setaElemento (lista j k v)
    (if (= j k)
        (cons v (cdr lista))
        (cons (car lista) (setaElemento (cdr lista) j (+ k 1) v))
    )
)

; Seta uma linha (lista) da matriz
(defun setaLista (matriz i k lista)
    (if (= i k)
        (cons lista (cdr matriz))
        (cons (car matriz) (setaLista (cdr matriz) j (+ k 1) lista))
    )
)

; Verifica se há uma ocorrência na lista
(defun verificaLista(lista elem matriz)
    (cond 
        ((null lista) T)
        ((= (getV (getP (car lista) matriz)) elem) NIL)
        (t  (verificaLista (cdr lista) elem matriz))
    )
)


; Criação da matriz 6x6, conforme exemplo
(set matriz
    (list 
    
        (list (make-point :r 0 :v 4) (make-point :r 0 :v 0) (make-point :r 1 :v 0) (make-point :r 2 :v 0) (make-point :r 2 :v 0) (make-point :r 2 :v 0) )
        (list (make-point :r 0 :v 0) (make-point :r 1 :v 0) (make-point :r 1 :v 0) (make-point :r 1 :v 0) (make-point :r 2 :v 0) (make-point :r 5 :v 0) )
        (list (make-point :r 0 :v 0) (make-point :r 3 :v 0) (make-point :r 1 :v 4) (make-point :r 4 :v 0) (make-point :r 2 :v 0) (make-point :r 5 :v 1) )
        (list (make-point :r 3 :v 0) (make-point :r 3 :v 0) (make-point :r 4 :v 0) (make-point :r 4 :v 2) (make-point :r 4 :v 0) (make-point :r 5 :v 0) )
        (list (make-point :r 3 :v 5) (make-point :r 6 :v 0) (make-point :r 6 :v 0) (make-point :r 4 :v 3) (make-point :r 7 :v 5) (make-point :r 5 :v 0) )
        (list (make-point :r 3 :v 0) (make-point :r 7 :v 0) (make-point :r 7 :v 0) (make-point :r 7 :v 0) (make-point :r 7 :v 0) (make-point :r 5 :v 0) )
        
    )
)