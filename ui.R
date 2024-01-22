library(shiny)
library(shinydashboard)


dashboardPage(
  dashboardHeader(title = "Crimes in Russia", titleWidth = 640),
  dashboardSidebar(
    sidebarMenu(
      id = "sidebar",
      menuItem("Dataset", tabName = "data", icon = icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      selectInput(inputId = "Var1", label = "Select the Variable", choices = c1, selected = "Terrorism"),
      menuItem(text = "Choropleth Map", tabName = "map", icon = icon("map"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "data",
              tabBox(
                id = "t1",
                width = 12,
                tabPanel(
                  "About", 
                  icon = icon("address-card"),
                  fluidRow(
                    column(
                      width = 8,
                      tags$img(src = "nuke.jpg", width = 600, height = 300),
                      tags$br(),
                      tags$a("Photo by Campbell Jensen on Unsplash"), align = "center"
                    ),
                    column(
                      width = 4,
                      tags$br(),
                      tags$p("This data set comes along with base R and contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also, given is the percent of the population living in urban areas.")
                    )
                  )
                ),
                tabPanel(title = "Data", icon = icon("address-card"), dataTableOutput("dataT")),
                tabPanel(title = "Structure", icon = icon("address-card"), verbatimTextOutput("structure")),
                tabPanel(title = "Summary Stat", icon = icon("address-card"), verbatimTextOutput("summary"))
              )
      ),
      tabItem(tabName = "viz",
              tabBox(
                id = "t2",
                width = 12,
                tabPanel(title = "Crime", value = "trends", h4("tabpanel 2 Placeholder")),
                tabPanel(title = "Distribution of Crimes", value = "distro", plotlyOutput("histplot")),
                tabPanel(title = "Summary Stat", h4("tabpanel 4 Placeholder")),
                tabPanel(title = "matrix", value = "matrix", h4("tabpanel 4 Placeholder"))
              )
      ),
      tabItem(tabName = "map",
              box(h1("Placeholder UI"))
      )
    )
  )
)