# 16-bit-simple-instruction-set-processor

![image](https://github.com/kanishk1605/16-bit-simple-instruction-set-processor/assets/105859363/d69b3c46-b33a-42db-b5ff-10126d425ddc)

CONTROL UNIT :
1. Primary objective to read instruction from instr register
2. Depending on operation i.e., specified in instr, perform the respective operation.
3. If Arithmetic operation then, Arithmetic unit. Also, specify Source & Destination reg
4. Data from the external world, then i/p buffer
5. Also control logical operation, read/write to data memory, as well as general purpose reg

Instruction Register :
1. 32 bit which stores the type of operation the user wants to perform
2. refer to it as "opcode"
3. Source & destination address specified here
4. A series of instructions  forms operation of our system ( program)

PROGRAM MEMORY :
1. Storing all instruction or single program
2. we could have multiple programs
3. Data from prog mem read by instr.  reg
4. then control unit processes it

GPR :
1. i/p read and stored in data mem
2. from data memory, GPR reads data
3. GPR cannot directly read/ write data from the external world
