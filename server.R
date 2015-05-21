library(shiny)
edu = read.csv("tamilnadu.csv") 

# Create as a matrix
edumat = as.matrix(edu)

tnTotal = edumat[2:19,7:28]

# Take transpose as this is necessary for plotting bar charts
tnmat = t(tnTotal)

# Set the scipen option to format the y axis (otherwise prints as e^05 etc.)
getOption("scipen")
opt <- options("scipen" = 20)
getOption("scipen")

shinyServer(function(input, output) {
  
  output$main_plot <- renderPlot({
    if (input$literacy == "a") {
        barplot(as.numeric(tnmat[6:7,]),names.arg=rep(tnmat[1,],each=2),main ="Persons attending educational institutions in TN - Males vs. Females", 
              xlab = "Age", ylab= "Number", col =c("red","darkblue"), legend= c("Males","Females"),beside=TRUE)   
    } else if (input$literacy == 'b') {
        #Calculate percent of males attending education of total
        percentM = round(as.numeric(eduM) *100/as.numeric(totalM),1)
        barplot(percentM,names.arg=tnmat[1,],main ="Percentage males attending educational institutions in TN ", 
              xlab = "Age", ylab= "Percentage", col ="lightblue", legend= c("Males")) 
    } else if (input$literacy == 'c') {
      #Calculate percent of females attending education of total
      percentF = round(as.numeric(eduF) *100/as.numeric(totalF),1)
      barplot(percentF,names.arg=tnmat[1,],main ="Percentage females attending educational institutions in TN ", 
            xlab = "Age", ylab= "Percentage", col ="lightblue", legend= c("Females")) 
    
    } else if (input$literacy == 'd') {
      #Pie chart for Tamil Nadu  of  persons between 15- 19 years attending school 
      slices <- c(tnmat[8,12],tnmat[11,12],tnmat[14,12],tnmat[17,12],tnmat[20,12])
      percentlabels <- round(as.numeric(slices) *100/as.numeric(tnmat[5,12],1))
      pielabels<- paste(percentlabels, "%", sep="")
      cols <- c("blue","green","cyan","red", "grey30")
  
     pie(as.numeric(slices), main="Tamil Nadu Literacy- Pie Chart", col=cols, labels=pielabels, cex=0.8)
      legend("topright", c("School","College","Vocational","Literacy center","Other"), cex=0.8, fill=cols)
    }
    
    output$text1 <- renderText({ 
       if(input$literacy == "a") {
         paste("Reactive output- option chosen : ", "Persons attending educational institutions in TN ")
       } else if(input$literacy == "b") { 
         paste("Reactive output- option chosen : ", "Percentage males attending educational institutions in TN ")
       } else if(input$literacy == "c") {
         paste("Reactive output- option chosen : ", "Percentage females attending educational institutions in TN ")
       } else if (input$literacy == "d") {
         paste("Reactive output- option chosen : ", "Tamil Nadu Literacy Pie Chart ")
       }
    })
  })
})