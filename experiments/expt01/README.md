
Proposal: Write an assembly language program, which:

- On reset, adds one to a counter, then goes into an infinite loop
  which repeatedly adds 1 (unsigned) to another counter;
- On any other exception or interrupt, adds one to a counter, then
  calls reset.
  
The idea is just to see what interrupts happen when the system is
starting.

The main challenge is that reset doesn't know when it's called for the
first time. So the plan is to write a special value to memory, one
that is unlikely to occur by chance, then check for the presence of
this value each time.






