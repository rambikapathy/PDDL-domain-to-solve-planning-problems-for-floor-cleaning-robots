(define (domain floor-tile)
 
            	;; We only require some typing to make this plan faster. We can do without!
            	(:requirements :typing)
 
            	;; We have two types: robots and the tiles, both are objects
            	(:types robot tile - object)
 
            	;; define all the predicates as they are used in the probem files
            	(:predicates 
 
	;; described what tile a robot is at
	(robot-at ?r - robot ?x - tile)
 
	;; indicates that tile ?x is above tile ?y
	(up ?x - tile ?y - tile)
 
	;; indicates that tile ?x is below tile ?y
	(down ?x - tile ?y - tile)
 
	;; indicates that tile ?x is right of tile ?y
	(right ?x - tile ?y - tile)
 
	;; indicates that tile ?x is left of tile ?y
	(left ?x - tile ?y - tile)
	
	;; indicates that a tile is clear (robot can move there)
	(clear ?x - tile)
 
	;; indicates that a tile is cleaned
	(cleaned ?x - tile)
            	)
 
 
 
(:action clean-up ;; action to implement the robot to clean upper tile
  :parameters (?r - robot ?y - tile ?x - tile) ;; cleaner data
  :precondition (and
	(robot-at ?r ?x) ;; check to locate the robot at tile ?x
	(up ?y ?x) ;; ensure the tile ?y is above ?x
	(clear ?y) ;; ensure tile ?y is clear to allow robot to clean.
	(not (cleaned ?y))
  ;; ensure the surface is dirty for robot to clean and not wet/been cleaned
  )
  :effect (and
	(not (clear ?y)) ;;robot is located on tile ?y, therefore not clear
	(cleaned ?y) ;; tile ?y is cleaned
  )
)
(:action clean-down ;; action to implement the robot to clean upper tile
  :parameters (?r - robot ?y - tile ?x - tile) ;; cleaner data
  :precondition (and
	(robot-at ?r ?x) ;; check to locate the robot at tile ?x
	(down ?y ?x) ;; ensure the tile ?y is below ?x
	(clear ?y) ;; ensure tile ?y is clear to allow robot to clean.
	(not (cleaned ?y))
  ;; ensure the surface is dirty for robot to clean and not wet/been cleaned
  )
  :effect (and
	(not (clear ?y)) ;;robot is located on tile ?y, therefore not clear
	(cleaned ?y) ;; tile ?y is cleaned
  )
)
     	
(:action up ;; action to implement the robot to move to upper tile
  :parameters (?r - robot ?y - tile ?x - tile) ;; cleaner data
  :precondition (and
	(robot-at ?r ?x) ;; check to locate the robot at tile ?x
	(up ?y ?x) ;; ensure the tile ?y is above ?x
	(clear ?y) ;; ensure tile ?y is clear to allow robot to move.
  )
  :effect (and
	(robot-at ?r ?y) ;; check that robot is moved from ?x to ?y
	(not (robot-at ?r ?x)) ;; ensure robot is not at tile ?x
	(clear ?x) ;;tile ?x is clear
            	(not (clear ?y)) ;;robot is located on tile ?y, therefore not clear
  )
)
 
(:action down ;; action to implement the robot to move to upper tile
  :parameters (?r - robot ?y - tile ?x - tile) ;; cleaner data
  :precondition (and
	(robot-at ?r ?x) ;; check to locate the robot at tile ?x
	(down ?y ?x) ;; ensure the tile ?y is below ?x
	(clear ?y) ;; ensure tile ?y is clear to allow robot to move.
  )
  :effect (and
	(robot-at ?r ?y) ;; check that robot is moved from ?x to ?y
	(not (robot-at ?r ?x)) ;; ensure robot is not at tile ?x
	(clear ?x) ;;tile ?x is clear
            	(not (clear ?y)) ;;robot is located on tile ?y, therefore not clear
  )
)
 
(:action left ;; action to implement the robot to move to upper tile
  :parameters (?r - robot ?y - tile ?x - tile) ;; cleaner data
  :precondition (and
	(robot-at ?r ?x) ;; check to locate the robot at tile ?x
	(left ?y ?x) ;; ensure the tile ?y is left to ?x
	(clear ?y) ;; ensure tile ?y is clear to allow robot to move.
  )
  :effect (and
	(robot-at ?r ?y) ;; check that robot is moved from ?x to ?y
	(not (robot-at ?r ?x)) ;; ensure robot is not at tile ?x
	(clear ?x) ;;tile ?x is clear
            	(not (clear ?y)) ;;robot is located on tile ?y, therefore not clear
  )
)
 
(:action right ;; action to implement the robot to move to upper tile
  :parameters (?r - robot ?y - tile ?x - tile) ;; cleaner data
  :precondition (and
	(robot-at ?r ?x) ;; check to locate the robot at tile ?x
	(right ?y ?x) ;; ensure the tile ?y is right to ?x
	(clear ?y) ;; ensure tile ?y is clear to allow robot to move.
  )
  :effect (and
	(robot-at ?r ?y) ;; check that robot is moved from ?x to ?y
	(not (robot-at ?r ?x)) ;; ensure robot is not at tile ?x
	(clear ?x) ;;tile ?x is clear
            	(not (clear ?y)) ;;robot is located on tile ?y, therefore not clear
  )
)
)


;; References:
;;[1]https://www.cs.toronto.edu/~sheila/2542/s14/A1/introtopddl2.pdf
;;Resource title: Introduction to PDDL
;;Author:Malte Helmert, Date: 16 October 
;;Accessed on: 19 May 2021

;; [2] https://github.com/pellierd/pddl4j/wiki/A-tutorial-to-start-with-PDDL
;; Resource title: A tutorial to start with PDDL
;;Author:fiorinoh , Date: 14 June 2018  
;;Accessed on: 21 May 2021

;; [3] Artificial Intelligence: A Modern Approach
;; Resource :Chapter 3
;;Author:Stuart Russel, Peter Norvig , Date: 13 December 1994
;;Accessed on: 17 May 2021



