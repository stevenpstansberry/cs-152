;;; CS 152
;;; Boss Mode



;;; Question 1:
;;; Function discriminant: three numbers -> number
;;; Returns the discriminant of three given numbers

(define
  (discriminant a b c)
  (-(* b b) (* 4 a c)))



;;; Question 2:
;;;Function flip: list -> list
;;; A function that takes in a list and returns a list with each pair
;;; of the consecutive words flipped
(define
 (flip xs)
  (cond (( null? xs) '()) ; base
        ((null? (cdr xs)) xs) ; checks to see if the remainder of the list is empty
        (else (cons (car(cdr xs)) (cons (car xs) (flip (cddr xs)))))))



;;; Question 3
;;;Function triple: list -> list
;;; A function that takes in a list and returns a new list where the items
;;; from the original list are repeated three times
(define
  (triple xs)
   (cond (( null? xs) '()) ;base case
        (else (cons (car xs) (cons (car xs) (cons (car xs) (triple (cdr xs)))))))) 

;;; Question 4
;;;Function all-but-last: list -> list
;;; A function that takes in a list and returns the list without the last element,
;;; or an empty list if given an empty list
(define
  (all-but-last xs)
  (cond ((null? xs) '()) ;base case
        ((null? (cdr xs)) '())
          (else(cons (car xs) (all-but-last (cdr xs))))))


;;; Question 5
;;; Function max-list : two lists -> list
;;; Function creates a new list by taking maximum
;;; of each index.
(define (max-list xs ys)
  (cond((and (null? xs) (null? ys)) '()) ; base case - if both xs and ys are empty, return an empty list, occurs when length of xs and ys are same
    ((null? xs) ys) ; if xs is empty, return the remainder of ys
    ((null? ys) xs) ; if ys is empty, return the remainder of xs
    (else (cons (max (car xs) (car ys)) (max-list (cdr xs) (cdr ys)))))) ; otherwise, recursively construct the max of xs vs ys with call to max list


;;;Question 6
;;; Predicate flat? :  list -> boolean
;;;  This predicate will return #f if the list contains a nested list, else it returns #t

(define (flat? xs)
  (cond((null? xs) #t) ; if our list is empty, return true
   ((list? (car xs)) #f) ; if the car returns a list, we have found a list, so return false 
   (else (flat? (cdr xs))))) ; recursively call flat?

  
;;; Question 7
;;; Function count-numbers : list -> number
;;; This function returns the count of the numbers in a list or its nested components

(define (count-numbers xs)
  (cond
    ((null? xs) 0)  ; base case, if our input list is empty, return 0
    ((number? (car xs)) (+ 1 (count-numbers (cdr xs))))  ; if car is a number, add one and recursively call count-numbers on the cdr
    ((list? (car xs)) (+ (count-numbers (car xs)) (count-numbers (cdr xs))))  ; if car is a list, count numbers in both the car and cdr
    (else (count-numbers (cdr xs)))))  


;;; Question 8
;;;Function leading : list predicate -> list
;;; This function takes in a list and a predicate function and returns a list
;;; with the elements of the original list that meet the predicate criteria.
;;; If the first element doesn't meet the criteria, an empty list is returned
(define (leading xs p)
  (cond((null? xs) '()) ;base case, if our input list is empty, return an empty list
      ((p (car xs))
            (cons (car xs) (leading (cdr xs) p)))
             (else '())))

;;; Question 9
;;;Function sum-of-squares: list -> number
;;; A tail recursive function that takes in a list of numbers and returns the
;;; sum of the squares of the elements in the list
(define (sum-of-squares xs)
  (define (sum-of-squares-helper xs sofar)
    (cond ((null? xs) sofar)
          ((sum-of-squares-helper (cdr xs) (+ sofar (* (car xs) (car xs)))))
          (else (sum-of-squares-helper (cdr xs) sofar))))
  (sum-of-squares-helper xs 0))



;;; Question 10
;;; Macro infix
;;; infix allows for the use of evaluation of expressions where there is a binary operator between the operands

(define-syntax infix
  (syntax-rules (- + * / < >)
    ((infix exp1 - exp2)
     (- exp1 exp2))
    
    ((infix exp1 + exp2)
     (+ exp1 exp2))
    
    ((infix exp1 * exp2)
     (* exp1 exp2))
    
    ((infix exp1 / exp2)
     (/ exp1 exp2))
    
      ((infix exp1 < exp2)
     (< exp1 exp2))
    
    ((infix exp1 > exp2)
     (> exp1 exp2))))


        





