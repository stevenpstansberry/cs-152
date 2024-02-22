;;;CS-152
;;; Midterm-1 Study Problems


;;; Function adjust-all: list of numbers -> list of numbers
;;; return a new list of numbers where numbers < 50 in the 
;;; original list are replaced with 50


(define (adjust-all xs)
  (cond ((null? xs)'()) ;base case, return empty list
  ((< (car xs) 50) (cons 50 (adjust-all (cdr xs)))) ;if the car of xs is less than 50, cons 50 to the recursive call to adjust-all
  (else(cons (car xs) (adjust-all (cdr xs)))))) ;otherwise cons the value of car xs to the call to adjust-all

(display "recursive adjust-all\n")
(adjust-all '(75 32 100 40 90)) ; -> (75 50 100 50 90)


;;; Function adjust-all: list of numbers -> list of numbers
;;; return a new list of numbers where numbers < 50 in the 
;;; original list are replaced with 50

(define (adjust-all-tail xs) ;wrap main function definition around body and include call to helper at bottom
(define (adjust-all-helper xs so-far)
  (cond ((null? xs) so-far)
  ((< (car xs) 50) (adjust-all-helper (cdr xs)(append so-far '(50)))) ; use
  (else(adjust-all-helper (cdr xs)(append so-far (list(car xs)))))))
  (adjust-all-helper xs '()))


(display "\ntail recursive adjust-all\n")
(adjust-all-tail '(75 32 100 40 90)) ;-> (75 50 100 50 90)


;;; Function adjust: number -> number
;;; If the number is >= 50, return as is. Otherwise return 50

(define (adjust number)
  (if (>= number 50) number 50))


;;; Function adjust-all-map: list of numbers -> list of numbers
;;; Return a new list of numbers where numbers < 50 in the original 
;;; list are replaced with 50
;;; Use higher order function like map!
(define (adjust-all-map xs)
  (map adjust xs))


;;; Function adjust-all-lambda: list of numbers -> list of numbers
;;; Return a new list of numbers where numbers < 50 in the original 
;;; list are replaced with 50
;;; Use lambda and or higher order function!!!!

(define adjust-all-lambda(lambda (xs)
                           (map adjust xs)))


;;; Function backwards: list -> list 
;;; return a new list where the elements are in reverse order
;;; Hint: use append!!

(define (backwards xs)
  (if (null? xs) '() (append (backwards(cdr xs)) (list (car xs)))))


;;; Function tail-recursive-backwards: list -> list 
;;; return a new list where the elements are in reverse order


(define (tail-recursive-backwards xs)
(define (backwards-helper xs so-far)
  (if (null? xs) so-far (backwards-helper (cdr xs) (cons (car xs) so-far))))
(backwards-helper xs '()))


;;; Predicate all-the-same?: list -> boolean
;;; return true is all the elements of the list are the same

(define (all-the-same? xs)
  (cond ((null? xs) #t)
  ((null? (cdr xs)) #t)
   ((equal? (car xs) (cadr xs)) (all-the-same? (cdr xs)))
   (else #f)))

;;; Function make-list: integer integer integer -> list
;;; return a list of integers from start to stop (including start and 
;;; stop) separated by step.

;(define (make-list))




