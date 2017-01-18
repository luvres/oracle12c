#!/bin/bash

downloadOracle () {

  # Part one
  local FILE_1="linuxamd64_12102_database_1of2.zip"
  local ORA_1="linuxamd64_12102_database_1of2.part-a"
  local URL_1="http://github.com/luvres/files/blob/master/linuxamd64_12102_database_1of2"
  local ora_partial_1=( 
    ${ORA_1}a
    ${ORA_1}b
    ${ORA_1}c
    ${ORA_1}d
    ${ORA_1}e
    ${ORA_1}f
    ${ORA_1}g
    ${ORA_1}h
    ${ORA_1}i
    ${ORA_1}j
    ${ORA_1}k
    ${ORA_1}l
    ${ORA_1}m
    ${ORA_1}n
    ${ORA_1}o
    ${ORA_1}p
  )
  for part in "${ora_partial_1[@]}"; do     
    wget -c $URL_1/$part?raw=true -O $part
  done

  cat ${ORA_1}* >${FILE_1}
  rm -f ${ORA_1}*

  # Part two
  local FILE_2="linuxamd64_12102_database_2of2.zip"
  local ORA_2="linuxamd64_12102_database_2of2.part-a"
  local URL_2="http://github.com/luvres/files/blob/master/linuxamd64_12102_database_2of2"
  local ora_partial_2=( 
    ${ORA_2}a
    ${ORA_2}b
    ${ORA_2}c
    ${ORA_2}d
    ${ORA_2}e
    ${ORA_2}f
    ${ORA_2}g
    ${ORA_2}h
    ${ORA_2}i
    ${ORA_2}j
  )
  for part in "${ora_partial_2[@]}"; do     
    wget -c $URL_2/$part?raw=true -O $part
  done

  cat ${ORA_2}* >${FILE_2}
  rm -f ${ORA_2}*


}; downloadOracle

