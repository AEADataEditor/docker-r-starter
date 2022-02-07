# set the date - for MRAN, this suffices, but for Rstudio Package Manager, you need additional info
mran.date <- "2022-01-03"

# For Rstudio Package Manager, if changing the date, figure out the suffix
# here: https://packagemanager.rstudio.com/client/#/repos/1/overview

rpm.suffix  <- "+Y3JhbiwyOjQ1MjYyMTU7NTY4Qjk1ODA"
# if you need source packages, use this repo.src one
repo.binary <- paste0("https://packagemanager.rstudio.com/all/__linux__/focal/",mran.date,rpm.suffix)
repo.src    <- paste0("https://packagemanager.rstudio.com/all/",mran.date,rpm.suffix)


# use the binary package manager 
options(repos=repo.binary)

pkgTest <- function(x,try=FALSE)
{
        if (!require(x,character.only = TRUE))
        {
                install.packages(x,dep=TRUE)
                if(!require(x,character.only = TRUE)) stop("Package not found")
        }
  if ( try ) {
    print(paste0("Unloading ",x))
    detach(paste0("package:",x), unload = TRUE, character.only = TRUE)
  }
  return("OK")
}


global.libraries <- c("abind","coda")

results <- sapply(as.list(global.libraries), pkgTest)

