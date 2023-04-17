library(pliman)

path <- "C:/Users/00090473/RWD"   # directory where the figures are stored
leaves <- 
  image_import("leaves.jpg",
               path = path,
               plot = TRUE)


#image segmentation


image_segment(leaves, index = "all")

#Using an object of known area

count <- analyze_objects(leaves, marker = "id")

count <-
  analyze_objects(leaves,
                  marker = "id",
                  fill_hull = TRUE)

count <-
  analyze_objects(leaves,
                  marker = "id",
                  fill_hull = TRUE,
                  object_size = "large")


analyze_objects(leaves,
                watershed = FALSE)

area <-
  get_measures(count,
               id = 11,
               area ~ 25)


area


image_segment(leaves, index = "NB", verbose = FALSE)
plot_measures(area,
              measure = "area",
              col = "red") # default is "white"


write.csv(area, file = "leaf features.csv", row.names = FALSE)

#https://tiagoolivoto.github.io/pliman/articles/leaf_area.html
