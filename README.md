# nyquist
This program is to be a Nyquist demonstration plotter in R/Shiny

It will plot a set of increasing amplitude sine waves to demonstrate the Nyquist sampling criteria graphically.

The plotter will plot several pi worth of cycles and then with a slider allow the user to modify the sample rate of the signal to demonstrate what the minimum criteria should be to sample a given frequency signal. I plan to add to the demonstration a frequency modulated signal and some other demonstration bells and whistles.

This commit:

  Adds the single page Shiny app with one slider that controls the number of cycles of the driver function.


To Do:

 The slider needs to be modified to show the number of cycles rather than the divisor for the frequency in the driver.
  Needs a divisor for number of plotted lines as well.
  Then add a sampler.
  


