# **ASSEMBLY LANGUAGE PROGRAMMING('80386', using NASM on UBUNTU Terminal)**

This Folder consists of Programs on Assembly Language(80386), using nasm assembler... 
...for the course **MICROPROCESSORS AND MICROCONTROLLERS**.

# *Local Environment Setup*

Assembly language is dependent upon the instruction set and the architecture of the processor.

To follow this tutorial, you will need
−
We will use the NASM assembler, as it is −
Free.   
You can download it from various web sources.
Well documented and you will get lots of information on net.
Could be used on both Linux and Windows.

#
# Installing NASM
If you select "Development Tools" while installing Linux, you may get NASM installed along with
the Linux operating system and you do not need to download and install it separately. For checking whether you already have NASM installed, take the following steps −
- Open a Linux terminal.
- Type ```whereis nasm``` and press ENTER.
- If it is already installed, then a line like, ```nasm: /usr/bin/nasm appears. ```Otherwise, you will
see just ```nasm:```, then you need to install NASM.

To install NASM, take the following steps −
- Check The netwide assembler (NASM) website for the latest version.
- Download the Linux source archive ```nasm-X.XX.ta.gz```, where ```X.XX``` is the NASM version
number in the archive.
- Unpack the archive into a directory which creates a subdirectory ```nasm-X. XX.```
- cd to ```nasm-X.XX``` and type ```./configure.``` This shell script will find the best C compiler to use
and set up Makefiles accordingly.
- Type make to build the nasm and ndisasm binaries.
- Type make install to install nasm and ndisasm in /usr/local/bin and to install the man pages.
This should install NASM on your system. Alternatively, you can use an RPM distribution for the
Fedora Linux. This version is simpler to install, just double-click the RPM file.

#
## Contents of the Tutorial : 
---
### -> Experiment01 :
    1. Program to display Hello World String with programmer name.
    2. Program to display 10 stars using one variable.

### -> Experiment02 :
    1. Program to accept a number and display it.
    2. Program to accept 2 numbers, add and display the result.
    3. Program to implement simple mathematical operations -i.e- (+ - / *).

### -> Experiment03 :
    1. Program to generate numbers from 1-9.
    2. Program to check whether entered number is Even or Odd.
    3. Program to check whether entered number is Positive or Negative.
    4. Program to find the greatest of three numbers.

### -> Experiment04 : 
    1. Program to convert a hexadecimal number to ASCII
    2. Program to count the number of positive and negative numbers from the array using procedures
    3. Program to count the number of odd and even numbers from the array using procedures
    4. Program to convert loowercase character to uppercase using procedures
    5. Program to convert uppercase character to lowercase using procedures
    
### -> Experiment05 : 
    1. Program to display string using macros.
    2. Program which contains the following macros:
        a. For calculating the fibonacii series for N
        b. For entering the value of N
        c. For displaying Numbers

    3. Program to compute and display the factorial of a number.

### -> Experiment06 : 
    1. Program to read and display array elements.
    2. Program to transfer a block of data from one location to another.
    3. Program to implement a bubble sort algorithm.

#
### **PROGRAM TO DISPLAY 'HELLO WORLD' MESSAGE**
#
```
section	.text
   global _start    ;must be declared for linker (ld)
	
_start:	            ;tells linker entry point
   mov	edx,len     ;message length
   mov	ecx,msg     ;message to write
   mov	ebx,1       ;file descriptor (stdout)
   mov	eax,4       ;system call number (sys_write)
   int	0x80        ;call kernel
	
   mov	eax,1       ;system call number (sys_exit)
   int	0x80        ;call kernel

section	.data
msg db 'Hello, world!', 0xa  ;string to be printed
len equ $ - msg              ;length of the string
```
#
## **Compiling and Linking an Assembly Program in NASM**
#
Make sure you have set the path of nasm and ld binaries in your PATH environment variable. Now, take the following steps for compiling and linking the above program −
Type the above code using a text editor and save it as hello.asm.
Make sure that you are in the same directory as where you saved hello.asm.

> 1. To assemble the program, type ```nasm -f elf hello.asm```

*If there is any error, you will be prompted about that at this stage. Otherwise, an object file of your program named ```hello.o``` will be created.*

> 2. To link the object file and create an executable file named hello, type ```ld -m elf_i386 -s -o hello hello.o```

> 3. Execute the program by typing ```./hello```

*If you have done everything correctly, it will display 'Hello, world!' on the screen.*

