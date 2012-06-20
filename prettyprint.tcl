set a [list a b c]
set b [list 1 2 3]
set c [list $a $b]

proc prettyRec { l i } {
  puts "pretty Rec $l : $i"
  set next ""
  set indent ""
  set space "  "
  for { set j 0} {$j < $i} {incr j} {
    append indent $space
  }
  set result "$indent\[\n"
  foreach x $l {
    if {[llength $x] == 1} {
      append result "$indent$space$x\n"
    } else {
      set next [prettyRec $x [expr $i + 1]] 
      append result "\n$next" 
    }
  }
  append result "${indent}]\n"
  return $result
}

proc pretty { l } {
  return [prettyRec $l 0]
}



set cP [pretty $c]
puts "cP:\n$cP"

set d [list $c [list "data" $c]] 
set dP [pretty $d]
puts "dP:\n$dP"

