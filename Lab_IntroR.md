```
# En R los comentarios comienzan con gato/hastag
# la ruta hacia un directorio donde trabajaremos se especifica con setwd("Ruta/hasta/el/directorio/") en comillas ""
setwd(~/Desktop/Sist/) # en Mac y Linux. La ~ representa tu hogar, o $HOME que es tu Nombre de usuario en tu compu
setwd("C:/Usuarios/TuNombre/Escritorio/Sist")  # en Windows
# Los paquetes o bibliotecas (libraries) se cargan de un depósito de CRAN con el comando install.packages("NombreDelPaquete")
install.packages("RColorBrewer") # por ejemplo, instala el paquete de creación de colores 
library(RColorBrewer) # y library() sin comillas carga al paquete
