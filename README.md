# 16-bit-simple-instruction-set-processor

![image](https://github.com/kanishk1605/16-bit-simple-instruction-set-processor/assets/105859363/d69b3c46-b33a-42db-b5ff-10126d425ddc)

CONTROL UNIT :
1. The primary objective is to read instructions from the instruction register
2. Depending on the operation i.e., specified in the instruction, perform the respective operation.
3. If Arithmetic operation then, Arithmetic unit. Also, specify Source & Destination reg
4. Data from the external world, then input buffer
5. Also control logical operation, read/write to data memory, as well as general purpose reg

Instruction Register :
1. 32 bit which stores the type of operation the user wants to perform
2. refer to it as "opcode"
3. Source & destination address specified here
4. A series of instructions  form the operation of our system ( program)

PROGRAM MEMORY :
1. Storing all instruction or single program
2. we could have multiple programs
3. Data from prog mem read by the instruction  register
4. then control unit processes it

GPR :
1. input read and stored in data memory
2. from data memory, GPR reads data
3. GPR cannot directly read/ write data from the external world

# Arithmetic-unit:

    Instruction Register:
    
![image](https://github.com/kanishk1605/16-bit-simple-instruction-set-processor/assets/105859363/624b1023-e5b9-432e-b38b-95fd8e9f0a02)

  1. 32-bit register
  2. Fields help to easily recognize the type of data represented by a specific set of bit

  31 -27 :
  1. 1st 5 bits represent an operation
  2. 2^5 = 32 possible operations supported by processor

  26 - 22 :
  1. Destination register - stores the result of the operation
  2. 5 bits, so from 00000 to 11111 i.e., 0-31
  3. Represents index of register where we want to store data
  - we will be assuming that we have an array in our code capable of storing 32 elements with 26-22 used as index

  21-17 :
  1. source register - acts as i/p
  2. The value specified is used as an Index to access contained reg

  16 :
  1. Mode selection - used to signify what will be the source of 2nd data i/p
  2. 2nd operation can either be
      a. content of a reg
      b. immediate data
  3. if mode selection
      a. = 1, the user will add immediate data to the instruction
      b. = 0, data will be present in one of the general-purpose register

  15 - 11 :
  1. mode selection = 0,
     The next 5 bits will be source reg - used to specify an address of 2nd source reg
  2. mode selection = 1,
     15 - 0 will be considered as immediate data for that instruction
  3. The immediate data maximum could be of size 16

Block Diagram:

![image](https://github.com/kanishk1605/16-bit-simple-instruction-set-processor/assets/105859363/6feb15a1-fc41-428f-b92c-3e99e7a6490c)


# Logical-Unit :

  1. A logical unit is added to the Arithmetic unit to form an ALU.
  2. ALU can perform all processes related to arithmetic and logic operations such as addition, subtraction, and shifting operations, including Boolean comparisons (XOR, OR, AND, and NOT operations). Also, binary      numbers can accomplish mathematical and bitwise operations.
  3. We access the data required for the Logical Unit from the General Purpose Register since they have same number of input bits.
  4. Here SGPR is not required

Logical operations supported in our project are:
    Bitwise operations like-- and, or, not, xor, xnor, nor, and.

1. all operations require 1 destination register & 2 source registers.
2. 2nd source register can be immediate data.
3. only not operation has 1 source & 1 destination register.

# Condition-Flags:
   1. These are not shown in the block diagram.
   2. They help control the flow of the processor.
   3. To achieve jump and branching operations, we need condition flags.

      The different condition flags in the processor are:
          1. SIGN flag:
              a. It is used to indicate whether the result is positive or negative.
              b. It is used specifically in Subtraction operations where, if the result is negative, we need to take 2's complement of the result of subtraction.

          2. ZERO Flag:
              a. It is Useful in Comparison operation.
              b. If we subtract 2 numbers and Z is set, then the number is equal.
              c. When the result consists of all zero, Z=1.
      
          3. CARRY Flag :
              a. Used during addition operation.
              b. It signifies whether the output of the operation generates a carry.

          4. Overflow Flag :
              a. Indicates whether there was an arithmetic overflow during the operation.
              b. It indicates that we have an unexpected result during an arithmetic operation.

# Program-and-Data-Memory:
    
      
![image](https://github.com/kanishk1605/16-bit-simple-instruction-set-processor/assets/105859363/4fead36d-6cb1-4f49-8442-70674414e598)
