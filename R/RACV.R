#' @title Intelligent clustered model out of The ACV
#'
#' @description Plot an Intelligent clustered model out of The ACV(Attribute,Consequence,Value) data imported from an Excel file.
#'
#' @param ExcelFile_Address,SheetName
#'
#' @return NULL
#'
#' @examples  ACV_Plotter("C:/Users/Mr-Nikseresht/Desktop/ACV_Table_Builder.xlsm","FinalResult")
#'
#' @export ACV_Plotter
ACV_Plotter<-function(ExcelFile_Address,SheetName)
{

  #To ignore the warnings during usage
  options(warn=-1)
  options("getSymbols.warning4.0"=FALSE)
  library(DiagrammeR)
  library(diagram)
  library(igraph)
  library(readxl)
  library(tidyverse)
  library(plot.matrix)
  library(ggplot2)
  #lst <- lapply(excel_sheets(File_Address), read_excel, path = File_Address,sheet = "FinalResult",col_names = FALSE)
  #Customer <- 0
  ACV_Table_Builder <- read_excel(ExcelFile_Address,
                                  sheet = SheetName, col_names = FALSE)

  #ACVInfo <- lst[[1]]

  #for (i in 2 : ACVInfo[4,4]$...4 + 1){
  colnames(ACV_Table_Builder) = ACV_Table_Builder[1, ]
  # the first row will be the header
  ACV_Table_Builder = ACV_Table_Builder[-1, ]
  #}

  # the first column will be the rownames

  #for (i in 2 : ACVInfo[4,4]$...4 + 1){

  ACV_Table_Builder<-ACV_Table_Builder %>% remove_rownames %>% column_to_rownames(var="x")


  #ACV_Table_Builder[is.na(ACV_Table_Builder)] <- 0
  #plotmat(ACV_Table_Builder,curve = 0,
       #           lwd = 1, box.lwd = 2, cex.txt = 0.8, self.cex = 0.5,
        #        self.shiftx = c(-0.1, 0.1, -0.1, 0.1),
        #          box.type = "diamond", box.prop = 0.5, main = "ACV Relations")



  ACV_Table_Builder<-t(ACV_Table_Builder)

  View(ACV_Table_Builder)




  #library(RColorBrewer)


  #we will select the first 12 colors in the Paired palette
  #cols<-brewer.pal(n=12,name="Paired")
  #plot(ACV_Table_Builder,col=cols)



  plot(ACV_Table_Builder,col=topo.colors, main="ACV Relations",na.col="red",
       xlab="",ylab="",digits=4,text.cell=list(cex=0.9))



  g<-graph_from_incidence_matrix(ACV_Table_Builder)

  layouts <- grep("^layout_", ls("package:igraph"), value=TRUE)[-1]

  # Remove layouts that do not apply to our graph.

  layouts <- layouts[!grepl("bipartite|merge|norm|sugiyama|tree", layouts)]



  par(mfrow=c(3,3), mar=c(1,1,1,1))

  for (layout in layouts) {

    print(layout)

    l <- do.call(layout, list(g))

    plot(g, edge.arrow.mode=0, layout=l, main=layout) }

  #View(ACV_Table_Builder)
 # plotmat(ACV_Table_Builder)



  #}
  #NumberofCustomers=ACVInfo[4,4]
  #x=NumberofCustomers+1

  #for (i in 2 : ACVInfo[4,4]$...4+1){
  #Customer[i-1] = lst[[i]]
  #}


}
