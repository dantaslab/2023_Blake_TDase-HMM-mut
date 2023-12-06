#======Set Colors===============================================================

type.pal <- c("DES1" = "deepskyblue4",
              "DES2" = "firebrick4",
              "none" = "gray70"
              )

type.pal_v2 <- c("DES1" = "deepskyblue4",
                 "DES2" = "firebrick4",
                 "none" = "gray70",
                 "DES2-exp" = "#FF9999"
)

log2.pal <- c("0" = "#FFFFFF",
              "1" = "#EEDEDE",
              "2" = "#DDBDBD",
              "3" = "#CD9C9C",
              "4" = "#BC7C7C",            
              "5" = "#AC5B5B",
              "6" = "#9B3A3A" #,
              #"7" = "#8B1A1A"
)

log2.color.count <- 8
log2.colors <- c("white", "firebrick4")
log2.colors.pal <- colorRampPalette(log2.colors)(8)

plot.colors <- c("Tet56-2" = "#00BA38",
                 "Tet56-3" = "#F8766D",
                 "Tet50" = "#00BFC4",
                 "empty" = "#b3b3b3"
)

#=====Custom defined themes=====================================================

theme_pub <- function() {

  color.background = "white"
  color.grid.major = "grey30"
  color.grid.minor = "grey60"
  color.axis.text = "#2a3132"
  color.axis.title = "#2a3132"
  color.title = "#2a3132"
  
  # Begin construction of chart
    theme_cowplot() +
    ggplot2::theme( 
        text = element_text(family = "Arial", size=8),
        line = element_line(size=0.3)
    ) +
      
    # Format the legend, hide by default
    ggplot2::theme(  
        legend.position    = "bottom",
        #legend.position    = "none",
        legend.margin      = margin(4, 4, 4, 4),
        legend.key.size    = unit(8, "pt"),
        legend.box.spacing = unit(4, "pt"),
        legend.text        = element_text(size=8, color = color.axis.title),
        legend.title       = element_text(size=10, face="bold")
    ) +
  
    # Set axis labels, text and format tick marks
    ggplot2::theme(  
           axis.text          = element_text(size=8),
           axis.text.x        = element_text(size = 8, angle = 0, color=color.axis.text, margin = margin(1, 0, 0, 0)),
           axis.text.y        = element_text(angle = 0, color=color.axis.text, margin = margin(0, 1, 0, 0)),
           axis.text.x.top    = element_text(margin = margin(0, 0, 1, 0)),
           axis.text.y.right  = element_text(margin = margin(0, 0, 0, 1)),
           axis.ticks         = element_line(size=0.3),
           axis.ticks.length  = unit(2, "pt"),

           axis.line          = element_line(size=0.3),
           axis.line.x        = element_line(size=0.3),
           axis.line.y        = element_line(size=0.3),
            
           axis.title         = element_text(size=10, face="bold", color = color.axis.title),
           axis.title.x.top   = element_text(margin = margin(0, 0, 2, 0)),
           axis.title.y.right = element_text(margin = margin(0, 0, 0, 2)),
           axis.title.x       = element_text(margin = margin(1, 0, 0.5, 0), vjust=0),
           axis.title.y       = element_text(margin = margin(0, 1, 0, 0.5), vjust=1.25)
    ) +

    # Format facet heading
    ggplot2::theme( 
            strip.text   = element_text(size=10, face="bold"),
            strip.text.x = element_text(margin = margin(3, 0, 1.5, 0)), 
            strip.text.y = element_text(margin = margin(0, 3, 0, 3)),
            # strip.background = element_rect(fill = "#efefef", color = "#2a3132"),
            strip.background   = element_blank()
    ) +
        
    ## Format the grid
    ggplot2::theme(
    #        panel.grid.major=element_line(color=color.grid.major,size=.50)) +
    #        panel.grid.minor=element_line(color=color.grid.minor,size=.50)) +
             panel.spacing      = unit(3, "pt")
    ) +
    
    # Format plot title and margin  
    ggplot2::theme(  
            plot.title = element_text(size=12, color=color.title),
            # plot.title = element_text(size=12, color=color.title, family = "Futura-Book"),
            # plot.margin = unit(c(0.35, 0.3, 0.35, 0.35), "cm"),
            plot.margin = margin(3, 3, 3, 3)
            
    )
}
