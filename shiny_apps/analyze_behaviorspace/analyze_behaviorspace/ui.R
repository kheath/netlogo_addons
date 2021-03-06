
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Analyze BehaviorSpace Experiments"),
  sidebarLayout(
    sidebarPanel(
      fileInput('file1', 'Choose CSV File',
                accept=c('text/csv',
                         'text/comma-separated-values,text/plain',
                         '.csv')),
      tags$hr(),
      selectInput('x_var', label = "x axis", choices = c("")),
      selectInput('y_var', label = "y axis", choices = c("")),
      selectInput('group_var', "Group by", choices = c("")),
      checkboxInput('points', 'points', value = TRUE),
      checkboxInput('lines', 'lines', value = FALSE),
      checkboxInput('error_bars', 'error bars', value = FALSE),
      checkboxInput('last_tick', 'Only show last tick', value = FALSE),
      tags$hr(),
      checkboxInput('summary_tab','Summary table?', FALSE),
      tags$hr(),
      fluidRow(
        downloadButton("save_plot", "Save Plot"),
        downloadButton("save_table", "Save Table")
      ),
      tags$hr(),
      h3("Rename variables"),
      selectInput('ren_from', label = "from", choices = c("")),
      textInput('ren_to', label = "to"),
      actionButton("rename", "Rename")
    ),
    mainPanel(
      plotOutput('plot'),
      DT::dataTableOutput('table')
    )
  )
))
