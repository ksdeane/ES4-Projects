# ES4-Labs
Contains labs from my ES4 class, "Introduction to Digital Logic" (https://www.ece.tufts.edu/es/4/about.html), which was centered on programming an Upduino iCE40 FPGA using VHDL on Lattice Radiant.

####Each lab folder holds the lab files from Lattice Radiant, my lab report, and the spec provided by my instructor. 

### Lab 5 - Building an ALU and displaying the result
----------
Built a 4-bit arithmetic logic unit (ALU) (to perform addition, subtraction, bitwise AND, and bitwise OR, selected based on two input signals), and displayed the output on a seven-segment display.

### Lab 6 - Flashing Displays
----------
Combined a sequential circuit with combinational logic to display a 2-digit number in base 10 on a seven-segment display. By
• Using the FPGA’s internal oscillator to drive sequential logic,
• Dividing the clock to toggle signals with varying frequencies, and 
• Dividing binary numbers on the FPGA by multiplying and shifting.

### Lab 7 - Using Memory (ROM)
----------
Combined sequential-logic building blocks to create a blinking animation on a 7-segment display. A read-only-memory (ROM) stores a sequence of frames for the snake animation, and a counter (or at least some bits of a counter) is used as the address for the ROM. As the counter counts, it selects different frames from the ROM, causingthe animation to flash on the seven seg.
