library(shiny)
library(bs4Dash)
library(haven)
library(DT)


Educ_data <- read_sav("ELRC2004_2005_Educators_data.sav")
ui <- dashboardPage(
  fullscreen = TRUE,
  scrollToTop = TRUE,
  title = "Data Analytics",
  header = dashboardHeader(
    title = dashboardBrand(
      title = "Data Analytics",
      image ="UKZN-logo.jpg"
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
  controlbar = dashboardControlbar(
    collsapsible = TRUE,
    div(class="p-3", skinSelector()),
    title = "Skin Selector",
  ),
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
                status = "danger",
                btnName = "Download",
                href = "https://stuukznac-my.sharepoint.com/:f:/g/personal/robertsd_ukzn_ac_za/Em0XWZovqfJFgKcEEg9b-9cBjLRGl4ZSqSPCjAYi_NIvgQ?e=gogSwX"
              ),
 
              fluidRow(
                userBox(
                  collapsible = TRUE,
                  title = userDescription(
                    title = "Mfundo Monchwe",
                    subtitle = "Data Scientist, MSc(Statistics) candidate ",
                    image = "mfundo.jpg",
                    type = 2
                  ),
                  status = "danger",
                  "I am a data scientist with a passion for data analysis and visualisation. I am currently working on a project that aims to investigate the spatial distribution of HIV risk among educators in South African public schools. I am using R to visualise the data and conduct the analysis. I am also using Bayesian statistics to model the data. I am excited to share my findings with you."
                  ),
                box (
                  title = "Data",
                  status = "danger",
                  solidHeader = TRUE,
                  collapsible = TRUE,
                  width = 6,
                  blockQuote(
                  "The data used in this project was obtained from the Department of Basic Education. The data contains information on the spatial distribution of educators in South African public schools. The data also contains information on the HIV status of educators. The data is stored in a CSV file and is cleaned and processed using R.",
                  color = "teal"
                  )
                ),
                userBox(
                  collapsible = TRUE,
                  title = userDescription(
                    title = "Dr Danielle J. Roberts",
                    subtitle = "PhD (Statistics), MSc (Statistics), BSc Honours (Statistics), BSc (Applied Mathematics & Statistics)",
                    image = "Danielle-Roberts.jpg",
                    type = 2
                  ),
                  status = "danger",
                  "Dr Danielle Jade Roberts holds a PhD in Applied Statistics. She has vast experience in teaching, curriculum development, research and student supervision in applied statistics and data science. She takes a data-driven approach to solve real world problems using statistics, machine learning and technology, with a focus on public health and other societal challenges in resource-limited settings in Africa.",
                  ribbon(
                    text ="Supervisor",
                    color = "success"
                  )
                ),
                userBox(
                  collapsible = TRUE,
                  title = userDescription(
                    title = "Dr Nombuso Zondo",
                    subtitle = "PhD (Statistics), MSc (Statistics), BSc Honours (Statistics), BSc (Applied Mathematics & Statistics)",
                    image = "Zondo.png",
                    type = 2
                  ),
                  status = "danger",
                  "Dr Nombuso Zondo is a lecturer in the discipline of Statistics and holds a PhD in Statistics. She has a passion for teaching statistics and its application in life matters. She is involved in undergraduate and postgraduate teaching in the statistics and data science streams. Her research interests have been in statistics education as well as applied statistics with the aim to cover a range of multidisciplinary applications.",
                  ribbon(
                    text ="Co-Supervisor",
                    color = "primary"
                  )
                )
                )
      ),
      tabItem(tabName = "data",
              tabBox(
                title = "Data",
                type = "tabs",
                width = 12,
                status = "danger",
                solidHeader = TRUE,
                tabPanel("Data Table",
              DT :: dataTableOutput("data_table"))
              )
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
  output$data_table <- DT::renderDataTable({
    DT::datatable(Educ_data)
  })
  
}

shinyApp(ui, server)