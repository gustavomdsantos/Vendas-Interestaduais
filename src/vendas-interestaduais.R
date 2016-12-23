# Vendas Interestaduais
# =====================
# Comparador de rotas alternativas de mercadorias para o estado do Brasil que 
# tiver a menor carga de impostos.
#
# Author: Gustavo Moraes <gustavosotnas1@gmail.com> <gustavomoraes@inf.ufg.br>
#
# This file is subject to the terms and conditions of the MIT License. 
# See the file COPYING in the main directory of this archive
# for more details.

# Variáveis GLOBAIS:
ARQUIVO_DADOS_TRIB <- "src/carga-tributaria-brasil.yml"

##
# Função que verifica se um pacote/biblioteca para R foi instalado. Se não, instala.
# 
# Argumentos:
#   x - o nome do pacote a ser verificado/instalado.
##
install <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
}

##
# Função que lê os dados de cargas tributárias no Brasil e estados vizinhos
# (no formato YAML) para uso no Vendas Interestaduais.
# 
# Retorna:
#   dados - uma estrutura de dados em R correspondente ao dados do YAML.
##
le_dados <- function()
{
  install("yaml")
  library(yaml)
  
  dados <- yaml.load_file(ARQUIVO_DADOS_TRIB)
}

#======== Main ========

dados <- le_dados()

cat ("A carga tributária no estado de Goiás é", dados$go$carga_tributaria*100, "%")

dados$al$vizinhos[1]