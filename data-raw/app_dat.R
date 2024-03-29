## code to prepare `app_dat` dataset goes here

usethis::use_data("app_dat")
library('rgdal')
library('sf')
library('ggplot2')
library('tigris')
library('data.table')
library('dplyr')

options(tigris_class = "sf")

## pull ward shapefile
url <- "https://information.stpaul.gov/api/geospatial/tseu-m286?method=export&format=Shapefile"
loc <- file.path(tempdir(), 'wards.zip')
download.file(url, loc)
unzip(loc, exdir = file.path(tempdir(), 'wards'), overwrite = TRUE)
file.remove(loc)
wards <- readOGR(file.path(tempdir(), 'wards'), stringsAsFactors = FALSE)
wards <- spTransform(wards, "+proj=longlat +datum=NAD83 +no_defs")
wards <- st_as_sf(wards)

## get blocks
blocks <- blocks("MN", county = "Ramsey", year = 2016)

# saint paul blocks
sp_blocks <- st_join(wards, blocks, st_intersects)
setDT(sp_blocks)
sp_blocks <- sp_blocks[, c('ward', 'GEOID10')]

sp_blocks[ward == "Ward 1", ward := "one"]
sp_blocks[ward == "Ward 2", ward := "two"]
sp_blocks[ward == "Ward 3", ward := "three"]
sp_blocks[ward == "Ward 4", ward := "four"]
sp_blocks[ward == "Ward 5", ward := "five"]
sp_blocks[ward == "Ward 6", ward := "six"]
sp_blocks[ward == "Ward 7", ward := "seven"]

sp_blocks_sf <- right_join(blocks, sp_blocks, on = "GEOID")

# fairly inaccurate at this point because of overlap
# ggplot(sp_blocks) +
#   geom_sf(aes(fill = ward)) +
#   scale_fill_viridis_d(option = "plasma") +
#   theme_minimal()

# will be updated later
usethis::use_data(sp_blocks_sf, overwrite = T)
