library(shiny)
library(bs4Dash)

ui <- dashboardPage(
  fullscreen = TRUE,
  title = "Data Analytics",
  header = dashboardHeader(
    title = dashboardBrand(
      title = "Data Analytics",
      image ="UKZN-logo.jpg"
      ),
    rightUi = dropdownMenu(
      badgeStatus = "info",
      type = "notifications",
      notificationItem(
        text = "success",
        status = "success",
        icon = icon("envelope")
      )
    )
  ),
  sidebar = dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Data", tabName = "data", icon = icon("database")),
      menuItem("Analysis", tabName = "analysis", icon = icon("chart-line")),
      menuItem("Reports", tabName = "reports", icon = icon("file-pdf"))
    )
  ),
  controlbar = dashboardControlbar(),
  footer = dashboardFooter(
    left = "Mfundo Monchwe",
    right = "2024"
  ),
  body = dashboardBody(
    tabItems(
      tabItem(tabName = "home",
             
              jumbotron(
                title = "HIV Risk Among Eudcatiors in South Afican
Public Schools: A Spatial and Bayesian Analysis
",
                lead = "Vsualising data with R",
                status = "info",
                btnName = "Download",
                href = "https://stuukznac-my.sharepoint.com/:f:/g/personal/robertsd_ukzn_ac_za/Em0XWZovqfJFgKcEEg9b-9cBjLRGl4ZSqSPCjAYi_NIvgQ?e=gogSwX"
              ),
 
              fluidRow(
                userBox(
                  collapsible = TRUE,
                  title = userDescription(
                    title = "Mfundo Monchwe",
                    subtitle = "Data Scientist",
                    image = "mfundo.jpg",
                    type = 2
                  ),
                  status = "info",
                  "I am a data scientist with a passion for data analysis and visualisation. I am currently working on a project that aims to investigate the spatial distribution of HIV risk among educators in South African public schools. I am using R to visualise the data and conduct the analysis. I am also using Bayesian statistics to model the data. I am excited to share my findings with you."
                  ),
                box (
                  title = "Data",
                  status = "info",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  width = 6,
                  blockQuote(
                  "The data used in this project was obtained from the Department of Basic Education. The data contains information on the spatial distribution of educators in South African public schools. The data also contains information on the HIV status of educators. The data is stored in a CSV file and is cleaned and processed using R.",
                  color = "danger"
                  )
                )
                )
      ),
      tabItem(tabName = "data",
              h2("Data")
      ),
      tabItem(tabName = "analysis",
              h2("Analysis")
      ),
      tabItem(tabName = "reports",
              h2("Reports")
      )
    )
  )
)
server <- function(input, output, session) {
  
}

shinyApp(ui, server)