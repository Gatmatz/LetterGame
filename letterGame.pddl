; Domain description
(define (domain letterGame) ; Domain name must match problem's

  ; Define what the planner must support to execute this domain
  ; Only domain requirements are currently supported
  (:requirements
    :strips                 ; basic preconditions and effects
    :negative-preconditions ; to use not in preconditions
    :equality               ; to use = in preconditions
    ; :typing               ; to define type of objects and parameters
  )

  ; Define the relations
  ; Question mark prefix denotes free variables
  (:predicates
    ; Entities
    (courier ?x)      ; An object ?x is a courier
    (spot ?x)      ; An object ?x is a spot
    (box ?x) ; An object ?x is a mail box
    (house ?x) ; An object ?x is a house
    (letter ?x) ; An object ?x is a letter
    
    ; Relations
    (has_house ?spot1 ?house1) ; A spot ?spot1 has a house ?house1.
    (has_box ?spot1 ?box1) ; A spot ?spot1 has a mail box ?box1.
    (has_letter ?house1 ?letter1) ; A house ?house1 has a letter ?letter1.
    (at ?courier1 ?spot1) ; A courier ?courier1 is at a spot ?spot1.
    (blue_subway ?courier1) ; A courier ?courier1 is in the blue line.
    (red_subway ?courier1) ; A courier ?courier1 is in the red line.
    (blue ?spot1 ?spot2) ; The blue subway line passes from ?spot1 to ?spot2.
    (red ?spot1 ?spot2) ; The red subway line passes from ?spot1 to ?spot2.
    (station ?spot1) ; The spot ?spot1 is a subway station.
    (road ?spot1 ?spot2) ; Spots ?spot1 and ?spot2 are connected by a road.
    (carries ?courier1 ?letter1) ; Courier ?courier1 carried the letter ?letter1.
    (sent ?letter1) ; The letter ?letter1 is at a mail box.
  )

  ; Define a transition to move a courier from a spot to another by road.
  (:action move
    :parameters (?agent ?from ?to)
    :precondition (and
      (courier ?agent)
      (spot ?from)
      (spot ?to)
      (at ?agent ?from)
      (road ?from ?to)
      (not (blue_subway ?agent))
      (not (red_subway ?agent))
      (not (= ?from ?to))
    )

    :effect (and
      (at ?agent ?to)
      (not (at ?agent ?from))
    )
  )
  ; Define a transition to enter a courier to the blue line.
  (:action enter_blue
    :parameters (?agent ?station1)
    :precondition (and
      (courier ?agent)
      (spot ?station1)
      (at ?agent ?station1)
      (station ?station1)
      (not (blue_subway ?agent))
      (not (red_subway ?agent))
    )

    :effect (and
      (blue_subway ?agent)
    )
  )
  
  ; Define a transition to enter a courier to the red line.
  (:action enter_red
    :parameters (?agent ?station1)
    :precondition (and
      (courier ?agent)
      (spot ?station1)
      (at ?agent ?station1)
      (station ?station1)
      (not (blue_subway ?agent))
      (not (red_subway ?agent))
    )

    :effect (and
      (red_subway ?agent)
    )
  )
  
  ; Define a transition to take out a courier from the blue line.
  (:action leave_blue
    :parameters (?agent ?station1)
    :precondition (and
      (courier ?agent)
      (spot ?station1)
      (at ?agent ?station1)
      (station ?station1)
      (blue_subway ?agent)
    )

    :effect (and
      (not (blue_subway ?agent))
    )
  )
  
  ; Define a transition to take out a courier from the red line.
  (:action leave_red
    :parameters (?agent ?station1)
    :precondition (and
      (courier ?agent)
      (spot ?station1)
      (at ?agent ?station1)
      (station ?station1)
      (red_subway ?agent)
    )

    :effect (and
      (not (red_subway ?agent))
    )
  )
  
  ; Define a transition to move a courier from a spot to another with the blue line of the subway.
  (:action move_blue
    :parameters (?agent ?from ?to)
    :precondition (and
      (courier ?agent)
      (spot ?from)
      (spot ?to)
      (at ?agent ?from)
      (blue_subway ?agent)
      (blue ?from ?to)
      (not (= ?from ?to))
    )

    :effect (and
      (at ?agent ?to)
      (not (at ?agent ?from))
    )
  )
  
  ; Define a transition to move a courier from a spot to another with the red line of the subway.
  (:action move_red
    :parameters (?agent ?from ?to)
    :precondition (and
      (courier ?agent)
      (spot ?from)
      (spot ?to)
      (at ?agent ?from)
      (red_subway ?agent)
      (red ?from ?to)
      (not (= ?from ?to))
    )

    :effect (and
      (at ?agent ?to)
      (not (at ?agent ?from))
    )
  )
  
  ; Define a transition to pick a letter from a house.
  (:action pick_letter
    :parameters (?agent ?spot1 ?house1 ?letter1)
    :precondition (and
      (courier ?agent)
      (spot ?spot1)
      (house ?house1)
      (letter ?letter1)
      (at ?agent ?spot1)
      (has_house ?spot1 ?house1)
      (has_letter ?house1 ?letter1)
      (not (blue_subway ?agent))
      (not (red_subway ?agent))
    )

    :effect (and
      (carries ?agent ?letter1)
      (not (has_letter ?house1 ?letter1))
    )
  )
  
  ; Define a transition to pick a letter from a house.
  (:action drop_letter
    :parameters (?agent ?spot1 ?box1 ?letter1)
    :precondition (and
      (courier ?agent)
      (spot ?spot1)
      (box ?box1)
      (letter ?letter1)
      (at ?agent ?spot1)
      (has_box ?spot1 ?box1)
      (carries ?agent ?letter1)
      (not (blue_subway ?agent))
      (not (red_subway ?agent))
    )

    :effect (and
      (sent ?letter1)
      (not (carries ?agent ?letter1))
    )
  )

)
