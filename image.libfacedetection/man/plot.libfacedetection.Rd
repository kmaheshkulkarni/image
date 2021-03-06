% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pkg.R
\name{plot.libfacedetection}
\alias{plot.libfacedetection}
\title{Plot detected faces}
\usage{
\method{plot}{libfacedetection}(x, image, border = "red", lwd = 5,
  only_box = FALSE, col = "red", cex = 2, ...)
}
\arguments{
\item{x}{object of class \code{libfacedetection} as returned by \code{\link{image_detect_faces}}}

\item{image}{object of class \code{magick-image} which was used to construct \code{x}}

\item{border}{color of the border of the box. Defaults to red. Passed on to \code{\link[graphics]{rect}}}

\item{lwd}{line width of the border of the box. Defaults to 5. Passed on to \code{\link[graphics]{rect}}}

\item{only_box}{logical indicating to draw only the box and not the text on top of it. Defaults to FALSE.}

\item{col}{color of the text on the box. Defaults to red. Passed on to \code{\link[graphics]{text}}}

\item{cex}{character expension factor of the text on the box. Defaults to 2. Passed on to \code{\link[graphics]{text}}}

\item{...}{other parameters passed on to \code{\link[graphics]{rect}}}
}
\value{
an object of class \code{magick-image}
}
\description{
Plot functionality for bounding boxes detected with \code{\link{image_detect_faces}}
}
\examples{
library(magick)
path <- system.file(package="image.libfacedetection", "images", "handshake.jpg")
x <- image_read(path)
x
faces <- image_detect_faces(x)
faces
plot(faces, x, border = "red", lwd = 7, col = "white")

## show one detected face
face <- head(faces$detections, 1)
image_crop(x, geometry_area(x = face$x, y = face$y, 
                            width = face$width, height = face$height))
## show all detected faces
boxcontent <- lapply(seq_len(faces$nr), FUN=function(i){
  face <- faces$detections[i, ]
  image_crop(x, geometry_area(x = face$x, y = face$y, 
                              width = face$width, height = face$height))
})
boxcontent <- do.call(c, boxcontent)
boxcontent
}
