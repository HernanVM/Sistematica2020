El código de **R** se visualiza de la siguiente forma. La práctica hace a _le maestre_
```
# En R los comentarios comienzan con gato/hashtag 
# la ruta hacia un directorio donde trabajaremos se especifica con setwd("Ruta/hasta/el/directorio/") en comillas ""
setwd(~/Desktop/Sist/) # en Mac y Linux las diagonales van / La ~ representa tu hogar, o $HOME que es tu Nombre de usuario en tu compu
setwd("C:\Usuarios\TuNombre\Escritorio\Sist")  # en Windows las diagonales en las rutas a un directorio van \
# Los paquetes o bibliotecas (libraries) se cargan de un depósito de CRAN con el comando install.packages("NombreDelPaquete")
install.packages("RColorBrewer") # por ejemplo, instala el paquete de creación de colores 
library(RColorBrewer) # y library() sin comillas carga al paquete
