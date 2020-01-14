## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(neurobase)

## -----------------------------------------------------------------------------
t1_file = tempfile(fileext = ".nii.gz")
url = paste0("https://johnmuschelli.com/", 
                       "open_ms_data/", "cross_sectional/",
                       "raw/patient01/T1W.nii.gz")
download.file(url, destfile = t1_file)
t1_file

## -----------------------------------------------------------------------------
library(neurobase)
img = readnii(t1_file)
img

## -----------------------------------------------------------------------------
sum(img)
sum(img > 1000)

## -----------------------------------------------------------------------------
img2 = img
img2[ img2 > 1000] = 1000
outfile = tempfile(fileext = ".nii.gz")
writenii(img2, outfile)
file.exists(outfile)

## ----logical------------------------------------------------------------------
above_zero = img > 0
class(above_zero)
img_data(above_zero)[1]

## ----multi_log----------------------------------------------------------------
class(img > 0 & img < 2)

## -----------------------------------------------------------------------------
class(img * 2)
class(img + (img / 4))
class(img * img)
class(img^2)

## ----ortho2-------------------------------------------------------------------
neurobase::ortho2(img)

## ----ortho2_noorient----------------------------------------------------------
neurobase::ortho2(img, add.orient = FALSE)

## ----all_slices---------------------------------------------------------------
oro.nifti::slice(img, z = 45)

## ----two_slice----------------------------------------------------------------
oro.nifti::slice(img, z = c(45, 50))

## ----one_slice_sag------------------------------------------------------------
oro.nifti::slice(img, z = 52, plane = "sagittal")

## ----one_slice_overlay--------------------------------------------------------
overlay(img, y = img > quantile(img, 0.9), z = 45, plot.type = "single", 
        NA.y = TRUE)

