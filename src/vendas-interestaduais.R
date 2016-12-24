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

  dados_list <- yaml.load_file(ARQUIVO_DADOS_TRIB)
}

##
# Função que obtêm dados de entrada por teclado do usuário e adiciona em uma
# variável do tipo String.
# 
# Retorna:
#   n - a string que armazena o que o usuário digitou.
##
scanner <- function(promptText)
{
  n <- readline(prompt=promptText)
  return(n)
}

##
# Função que obtêm dados de entrada por teclado do usuário e adiciona em uma
# variável do tipo inteiro.
# 
# Retorna:
#   n - o inteiro que armazena o que o usuário digitou.
##
scanner_int <- function(promptText)
{
  n <- readline(prompt=promptText)
  return(as.integer(n))
}

##
# Função que exibe um cabeçalho pro usuário e solicita-lhe os dados necessários.
# 
# Retorna:
#   entrada - conjunto de dados de entrada do usuário:
#     * sigla do estado de origem do(s) produto(s);
#     * sigla do estado de destino do(s) produto(s);
#     * preço total do(s) produto(s).
##
input <- function()
{
  cat("\nVENDAS INTERESTADUAIS")
  cat("\n=====================\n\n")
  
  origem <- scanner("Entre com a sigla do estado de ORIGEM do(s) produto(s): ")
  destino <- scanner("Entre com a sigla do estado de DESTINO do(s) produto(s): ")
  total <- scanner_int(
    "O preço total do(s) produto(s) (com frete + IPI + seguro + outras despesas): ")
  
  return(c(origem, destino, total))
}

##
# Função que calcula qual a rota que passa pelos estados do Brasil que tem as 
# menores cargas tributárias possível.
# 
# Retorna:
#   rota - uma String contendo a rota a ser percorrida.
##
gera_melhor_rota <- function()
{
  
}

##
# Obtêm o nome do estado do Brasil vizinho a um determinado estado que tem a 
# menor carga tributária dentre todos os vizinhos a este.
# 
# Argumentos:
#   estado - o nome do estado a ser pesquisado os seus vizinhos.
# 
# Retorna:
#   vizinho_menor_carga - o nome do estado vizinho de menor carga tributária.
##
obtem_vizinho_menor_carga <- function(estado)
{
  # for(vizinho in estado)
  # dados[[estado]]$vizinhos[1]
}

#======== Main ========

dados <- le_dados()
entrada_usuario <- input()