# Vendas Interestaduais
# ---------------------
# Autor: Gustavo Moraes

# Função que verifica se um pacote/biblioteca para R foi instalado. Se não, instala.
instala_dependencia <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

instala_dependencia("yaml")
library(yaml)

dados <- yaml.load_file("src/carga-tributaria-brasil.yml")

cat ("A carga tributária no estado de Goiás é", dados$go$carga_tributaria*100, "%")

dados$al$vizinhos[1]