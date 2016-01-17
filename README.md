# RMScheduling
Rate Monotonic Linux Kernel Scheduling 

Design and Implementation
We use the write function as the API for registration for application. 
This way, the user’s application can easily send an integer (4 bytes) with the process id. 
Inside the module, this integer is handled and a new element in the list is created. 
The user also send one letter indicating the action: Yield, Register or Deregister. 

We implemented the write function in a way that it returns -1 when there was an error 
with the process trying to do some action. In this way, when the process register itself, 
it can check whether it was successful or not. Of course, it can also read all the process using this module. 
This is tested using cat command. 

In the timer interruption we only do three things: 
1. Look for the pid
2. Change its state to ready
3. Wake up the dispatching thread

This way, the routine is short and exhibits good performance. 
For setting up the timer, we used the method that converts milliseconds to jiffies. 
This way we can be sure that we are setting the timer with the correct interval without 
worrying about jiffies conversions. Since this method is implemented within the kernel, 
we are sure its performance is good. 

We used the slab allocator as suggested, in order to ensure high performance in the 
allocation of an incoming task.

We used some macros to implement the finite states machine of our module. 

We also decided to implement a global variable for the total utilization in order 
to ensure that the admission control is always a O(1) operation, which increase performance and scalability of our module. 

We finally made a check for each allocation to have its proper deallocation at the end, 
in order to make sure that no memory leaks are present. 
