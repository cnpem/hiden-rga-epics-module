dbCreateAlias(pdbbase, "${P}${R}MID${MID}Pressure-Mon", "${P}${R}Mass${Mass}-Mon")

afterIocRunning "dbpf ${P}${R}Cmd:MID${MID}Set-Cmd_ 1"
afterIocRunning "dbpf ${P}${R}Mass:MID${MID}-SP ${Mass}"
afterIocRunning "dbpf ${P}${R}Type:MID${MID}Detr-Sel 0"
afterIocRunning "dbpf ${P}${R}P:MID${MID}AutoRng-Sel 1"
afterIocRunning "dbpf ${P}${R}P:MID${MID}Curt-SP -6"
afterIocRunning "dbpf ${P}${R}Cmd:MID${MID}Set-Cmd 1"
