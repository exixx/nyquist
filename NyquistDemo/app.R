# nyquist demonstration Shiny app
# written by exixx
# exixx @ exixx . com

library(shiny)
library(shinythemes)




# Define UI for application - give me a plot and a slider for the cycles to start
ui <- shinyUI(fluidPage(
  theme = shinytheme("flatly"),
   
   # Application title
   titlePanel("Nyquist Demonstration"),
   
  plotOutput("sinePlot"),
   # Sidebar with a slider input for number of cycles. Irritatingly higher is fewer cycles.
   sidebarLayout(
      sidebarPanel(
         sliderInput("freq",
                     "1/f (higher = less cycles):",
                     min = 35,
                     max = 2400,
                     value = 80),
         sliderInput("samps",
                     "Number of samples:",
                     min = 8,
                     max = 5000,
                     value = 100)
         
      ),
      
      # Show a plot of the generated set of sine waves
      mainPanel(
         
      )
   )
))

# Define server logic required to draw a histogram
server <- shinyServer(function(input, output) {
   
   output$sinePlot <- renderPlot({
     
     #num_samp <- 50 #original 5000
     num_freq <- 2048 #500 #original 1024
     divisor <- 100
     row_names <- paste("t", (1:input$samps), sep = "")
     col_names <- paste("f", (1:num_freq), sep = "")
     a = array(0, dim = c(input$samps, num_freq), dimnames = list(c(row_names), c(col_names)))
     
     a_frame <- data.frame(a)
     
     az_deg <- seq(0, 719.5, length.out = input$samps)
     az_rad <- seq(0, 2 * pi, length.out = input$samps)
     drive_func <- function (amp, omega, ttt) {
       a_line <-  amp *cos((omega* pi/input$freq)* ttt )
     }
     
     amps <- 1:num_freq
     
     # this loop sucks. time to learn lapply
     for( ii in amps ) {
       a_frame[ii] <- drive_func(ii,5, az_deg)

     }
     # unlist(lapply(amps, function(ii) (a_frame[ii] <- drive_func(ii, 5, az_deg))))
     jj <- 1:input$samps
     a_frame[jj,] = a_frame[jj,] *jj/divisor
     
     #set up a list of color numbers for the lines to make the display aesthetically pleasing.
     colrs <- rainbow(num_freq)
     
     file_name = "Test Sines" #This can be modified to generate a file name/title.
     #I probably won't do that but I'm leaving it in anyway.
     plot_a_line <- function(xx) {plot(1:input$samps,a_frame[,xx], 
                                     type = "l",
                                     col = colrs[xx],
                                     ylim = range(a_frame[,xx]),#*(3/5),
                                     ylab = "Some Bullshit Magnitude (dB Bullshit)",
                                     xlab = "Azimuth (degrees or something))",
                                     main = paste("Test Plot", file_name),
                                     bg = "white",
                                     axes = FALSE
     )}
     
     add_a_line <- function(xx) {lines(1:input$samps,a_frame[,xx], 
                                       type = "l",
                                       col = colrs[xx],
                                       #ylim = range(a_frame[,xx]),
                                       ylab = "Some Bullshit Magnitude (dB Bullshit)",
                                       xlab = "Azimuth (degrees or something))",
                                       main = paste("Test Plot", file_name),
                                       bg = "white"
     )}
     
     
     
     
     
     plot_a_line(num_freq)
     
     for (i in seq(num_freq, 1, by = -100)) {
       add_a_line(i)
     }
   })
})

# Run the application 
shinyApp(ui = ui, server = server)

