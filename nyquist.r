make_config <- function (rows, cols) { #}, row_names, col_names) {
  a = array(0, 
            dim = c(rows, cols),
            #dimnames = list(c(row_names), c(col_names))
  )
  b = data.frame(a)
  return(b)
}

num_samp <- 5000
num_freq <- 1024

a_frame <- make_config(num_samp, num_freq)
az <- seq(0, 359.5, length.out = num_samp)
drive_func <- function (amp, omega, ttt) {
  a_line <-  amp *cos((omega* pi/25)* ttt )
}

amps <- 1:num_freq

for( ii in amps ) {
  a_frame[ii] <- drive_func(ii,5, az)
  
}
jj <- 1:num_samp
a_frame[jj,] = a_frame[jj,] *jj/200

colrs <- rainbow(length(num_freq))

file_name = "Test Sines"
plotaline <- function(xx) {plot(1:num_samp,a_frame[,xx], 
                                type = "l",
                                col = "red",#colrs[xx],
                                ylim = range(a_frame[,xx])*(1/2),
                                ylab = "Some Bullshit Magnitude (dB Bullshit)",
                                xlab = "Azimuth (degrees or something))",
                                main = paste("Test Plot", file_name),
                                bg = "white",
                                axes = FALSE
)}

a_line <- function(xx) {lines(1:num_samp,a_frame[,xx], 
                              type = "l",
                              col = colrs[xx],
                              ylim = range(a_frame[,xx]),
                              ylab = "Some Bullshit Magnitude (dB Bullshit)",
                              xlab = "Azimuth (degrees or something))",
                              main = paste("Test Plot", file_name),
                              bg = "white"
)}

divisor <- 300



plotaline(num_freq)
for (i in seq(1, num_samp, by = num_samp/(2*divisor))) {
  a_line(i)
}


#cols <- colors(distinct = TRUE)
