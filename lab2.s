.data
    decimalNumber: .string "21602"
    .equ numberofDecDigits, (. - decimalNumber - 1);
    hexarray: .ascii "0123456789ABCDEF"
.bss
    .lcomm i, 4
    .lcomm numHexDigits, 4
    .lcomm hexDigits, 4
    .lcomm temp, 4
    .lcomm decDigit, 4
    .lcomm hexDigit, 4
.text
.global _start
_start:
    call accumulateDecimalNumber
    call convertDectoHex 
    call bye
bye: #procedure 1
    mov $1, %eax
    mov $0, %ebx
    int $0x80
getdecimalDigit: #procedure 2
   mov $decimalNumber , %edi # $ = & edi used for string procedures
   mov i , %ecx #ecx used for loops commonly
   movb (%edi,%ecx,1), %ebx  #array thats located in edi. take index ecx, each element is 1 byte long () dereferences the memory location
   sub $'0', %ebx #the b moves and subtracts one byte
   mov %ebx,decDigit #equivalent to decDigit
   ret
gethexDigit: #procedure 3
    mov decimal, %eax #eax holds the quotient , the decimal number?
    mov 
    idivl $16 #dividing by 16 as per algorithm 
    mov %edx, hexDigit # remainder holds value from edx register
    mov %eax, decimal #moving updated value into decimal
    ret
accumulateDecimalNumber: #procedure 4
    mov $0 , decimal
    mov $0, i
    adnwhileLoop:
    call getdecimalDigit
    mov decimal, %eax #stores decimal 
    imul $10 #multiply by 10 
    addl decDigit, %eax #adds decDigit to decimal
    mov numberOfDecDigits, %ebx
    dec %ebx
    cmp i,%ebx
    jle adnendwhileLoop
    inc i
    jmp adnwhileLoop
    adnendwhileLoop:
    ret
numberOfHexDigits: #procedure 5
    mov decimal, %eax
    mov $0, numHexDigits
    nhdwhileLoop:
    inc numHexDigits
    cmp $0, %eax #eax is temp  
    je endwhileLoop
    mov $0, %edx
    idiv $16
    jmp nhdwhileLoop
    endwhileLoop:
    ret
convertDectoHex: #procedure 6
    mov $0, numHexDigits
    call numberOfHexDigits
    mov numHexDigits, %eax
    sub $1, %eax
    d2hwhileLoop:
    call gethexDigit
    mov hexDigit, %ebx #line 69
    mov $hexarray, %esi #stores string array in esi register (source index)
    mov i, %ecx
    mov $hexDigits, %edi #line 69 (destination index)
    cmp $0, %eax
    jle d2hendwhileloop
    dec i 
    jmp d2hwhileLoop
    d2hendwhileloop:
    ret
