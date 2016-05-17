# nyquist
This program is to be a Nyquist demonstration plotter in R/Shiny

It will plot a set of increasing amplitude sine waves to demonstrate the Nyquist sampling criteria graphically.

The plotter displays a plot of varying numbers of cycles and sample rate via sliders to calculate a data frame full of amplitude varying sine waves of varying sample rate. This set was generated to provide an aesthetically pleasing display for manipulation to demonstrate the requirements for Nyquist sampling rates. This set consists of sine waves of varying amplitudes at a constant frequency, sampled at a settable rate.

The set is calculated each time the sliders are manipulated, which can result in a slight delay. The upper sample rate is far more than is required to adequately sample the signals, but I also wanted to get an idea of how R behaves when carrying around 10M or so of a data frame. Quite well, it seems, though the delay is a tad bit more than I would like.

This commit:
  - Moved the controls to the bottom to make the plot larger.
  - Adjusted the frequency slider to cover the desired range of frequencies, but irritatingly it is reversed from what I want. I'll have to fiddle with the equation to get it right.
  - Having trouble figuring out exactly how many cycles I want to display and getting a solid explanation of the signals formulated.
  - Added a slider for number of samples, and to get the range for the nyquist display correct. Low sample rates, harmonic sampling error, and various under/oversampling situations can be observed.
  - Added shinythemes and added a theme, but really want to use the yeti bootstrap theme, so I'll be establishing a www/ directory next commit. Also want to include a graphic, so I'll need it.
  

Old Commits:
  - Adds the single page Shiny app with one slider that controls the number of cycles of the driver function.


To Do:

 The slider STILL needs to be modified to show the number of cycles rather than the divisor for the frequency in the driver.
  Needs a divisor for number of plotted lines as well.
  Perhaps a thickness setting in conjunction with the divisor more nicer looking displays?
  
  


