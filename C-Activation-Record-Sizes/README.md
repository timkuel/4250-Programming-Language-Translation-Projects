Author:	Timothy Kuelker
Date:	November 21, 2019
Course:	CMPSCI 4250 - Programming Languages

** Important **


	** Run Time Stack Growth **

	I noticed that when I would subtract the previous address of the activation
record by the current address of the activation record, the number calculated would 
always be negative.  After doing some research, I discovered that my RUN TIME STACK 
grows downwards on my machine.  I also did a bit of test code to see which direction 
it grew, and confirmed it is downwards.

	Due to this, I had to calculate the size of the current activation record a 
slightly different way than described in the project description.

	

*** The following lines preceeded by `---` are now invalid.  ***

---	** Size of Activation Record Differences**
---
---	Even though I set up f2() directly from f1() and just took away the recursive 
--- ability, I get different sizes for the Activation Record. I don't know if this is due 
--- to how my stack grows (stated above), but the numbers are similar enough that it seems
--- like that is the normal output.
---
---	Along with that, the initial value of f3()'s activation record size is a positive 
--- number, in your example it is negative.  Again, I believe this is due to how my stack 
--- grows and that it is a normal output.




	** Fix for Activation Record Differences  **

	After executing the program through my terminal, I was able to get better results
for f2() compared to when I ran it on C-Lion.   Afterwards, I decided to see if I could fix the 
Activation Record size differneces with f1() & f2().   I found out that if I initalized the character
array `values` at declaration in f1() and NOT AT ALL in f2(), it gave me the same size for the 
activation records in f2() that was calculated in f1().

