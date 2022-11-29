(define list_for_tokens '())
(define op (make-hash))
(hash-set! op "-"  (lambda (x y) (- x y )))
(hash-set! op  "/"  (lambda (x y) (/ x y)))
(hash-set! op  "+"  (lambda (x y) (+ x y)))
(hash-set! op "*" (lambda (x y) (* x y)))
(define (parser x)
    (cond [(eq? (length x) 0) (car list_for_tokens)]
    [else
    (cond [(string->number (car x))
           (println x)
            (set! list_for_tokens (append list_for_tokens (list (string->number (car x)))))
            (println x)
            (println list_for_tokens)
            (parser (cdr x))
            ]
        [else
         (cond 
         [
          (> (length list_for_tokens) 2)
            (set! list_for_tokens (append (drop-right list_for_tokens 2)
            (list ((hash-ref op (car x)) (last (drop-right list_for_tokens 1)) (last list_for_tokens)))
            ))
            (parser (cdr x))
         ]
         [else 
          (set! list_for_tokens (list ((hash-ref op (car x)) (car list_for_tokens) (car (cdr list_for_tokens)))))
          (println list_for_tokens)
          (println x)
          (println (cdr x))
         (parser (cdr x))
         ]
         )
         
         
        
        ]
        )]))
         
        
        
        
        
            
        
        

         
