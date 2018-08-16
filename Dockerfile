FROM ubuntu

ENV myName takumi sasamoto
ENV myDog cherry
ENV myCat muu

RUN echo "$myName, $myDog, $myCat"
