# 📊 Análise de Dados – OCD Patient Dataset (Demographics and Clinical Data)

Dataset: [Kaggle](https://www.kaggle.com/datasets/ohinhaque/ocd-patient-dataset-demographics-and-clinical-data)

Tema: Transtorno Obsessivo-Compulsivo (TOC – OCD)
Objetivo: Explorar dados sociodemográficos e clínicos de pacientes diagnosticados com TOC e responder a questões analíticas relacionadas a gênero, etnia, comorbidades, tipos de obsessão/compulsão, entre outros fatores.

## 📁 1. Sobre o Dataset

O dataset contém informações anonimizadas de pacientes com TOC, incluindo:

  * Dados demográficos (gênero, etnia, escolaridade, estado civil)
  * Dados clínicos (tipo de obsessão/compulsão, pontuação Y-BOCS, comorbidades)
  * Informações temporais (data de diagnóstico)

Essas variáveis permitem realizar análises exploratórias tanto descritivas quanto relacionais, envolvendo grupos e características clínicas.

## 🧹 2. Preparação dos Dados

As etapas de tratamento incluíram:

 ✔ Importação e leitura dos dados
 
 ✔ Padronização de valores categóricos

 ✔ Conversão de datas (para extração de mês)

## 🧠 3. Perguntas Investigações & Resultados

A seguir, apresento as 10 perguntas e os resultados obtidos durante a análise:

1. Contagem e porcentagem de mulheres versus homens com TOC e pontuação média de obsessão por gênero

   * Foram contabilizados os pacientes por gênero,
   * Calculou-se a porcentagem relativa ao total,
   * Calculou-se a porcentagem relativa ao total,
   * Comparou-se a pontuação Y-BOCS média entre gêneros.
   
    
</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/Genero.png"></td>            
              </tr>
       </table>
</body>
</html>
 
   **Insights** :
  
    * É possível observar se existe predominância de TOC em algum gênero

2. Número de pacientes por etnia e suas respectivas pontuações médias de obsessão

  Agrupou-se por etnia onde observamos o número de pacientes. 
 

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/Etnia.png"></td>            
              </tr>
       </table>
</body>
</html>

 
   **Insights** :
  
    * Permite avaliar distribuição étnica no dataset,
   
    * Investiga se algum grupo apresenta escore significativamente maior de obsessão.

3. Número de pessoas diagnosticadas com TOC por mês

  * A coluna de data foi convertida para formato datetime, extraído o mês de diagnóstico e gerando um agrupamento mensal.

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/periodo.png"></td>            
              </tr>
       </table>
</body>
</html>

   **Insights** :
  
    * Identifica padrões temporais (picos de diagnóstico, sazonalidade etc.)

4. Qual é o tipo de obsessão mais comum e sua respectiva pontuação média de obsessão?

   * Agrupado por tipo de obsessão, ordenado pela contagem para achar o tipo mais frequente
 
</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/tipo_obsessao.png"></td>            
              </tr>
       </table>
</body>
</html>
 
   **Insights** :
   
     * Identifica o perfil clínico mais recorrente
        
5. Qual é o tipo de compulsão mais comum e sua respectiva pontuação média de obsessão?

  * Mesmo processo da questão anterior, porém para compulsões.
  
</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/tipo_compulsao.png"></td>            
              </tr>
       </table>
</body>
</html>
 
  **Insights** :
  
    * Permite analisar possíveis correlações entre tipos de compulsão e gravidade.
    

6. Qual a porcentagem de pacientes que enfrentam TOC junto com Depressão, Ansiedade, ou ambos?

  * Criou-se categorias: Somente Depressão, Somente Ansiedade, Depressão + Ansiedade, Sem comorbidades


</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/comorbidade.png"></td>            
              </tr>
       </table>
</body>
</html>
 
   **Insights** :
   
    * Altas taxas de comorbidade são esperadas em TOC
    
    * Esses dados ajudam a entender o perfil clínico associado
   
7. Existe um tipo de obsessão dominante para cada nível de educação?
 
  * Agrupou-se por education_level e encontrou-se o tipo de obsessão com maior contagem dentro de cada grupo.

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/Educacao.png"></td>            
              </tr>
       </table>
</body>
</html>
  
   **Insights** :
   
    * Investiga se escolaridade influencia o tipo de manifestação obsessiva
  
8. Pacientes casados apresentam pontuações Y-BOCS menores do que solteiros ou divorciados?
 
   * Comparou-se a média de Y-BOCS entre grupos: Casados, Solteiros, Divorciados

</head>
    <body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/estado_civil.png"></td>            
              </tr>
       </table>
 </body>
 </html>
  
   **Insights** :
   
    * Sugere se apoio social/relacional pode estar relacionado a menor gravidade dos sintomas
 
9. Pessoas com obsessões “Harm-related” possuem maior incidência de Depressão do que aquelas com “Symmetry”?
 
  * Filtrou-se o dataset para cada tipo e calculou-se a porcentagem com depressão.

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/depressao.png"></td>            
              </tr>
       </table>
</body>
</html>

   **Insights** :
   
    * Avalia a relação entre conteúdo obsessivo e comorbidade depressiva.
  
10. Qual é a combinação de Gênero + Estado Civil com a maior pontuação média de Y-BOCS?
 
  * Foi analisado se a influência e o estado civil estão relacionado ao TOC e calculada a média de Y-BOCS por categoria.

</head>
<body>
       <table>
              <tr>
                     <td><img src= "https://github.com/lannacassio/Conjunto-de-Dados-de-Pacientes-com-TOC-Dados-Demogr-ficos-e-Cl-nicos/blob/main/Imagens/genero_estado_civil.png"></td>            
              </tr>
       </table>
</body>
</html>

  
   **Insights** :
   
    * Ajuda a identificar subgrupos de maior risco clínico

## 📈 4. Visualizações

Durante a análise, foram utilizadas visualizações para facilitar a interpretação, como:

Gráficos de barras (contagens e médias)

Histogramas (distribuição dos escores)

Gráficos de pizza (proporções)

Boxplots (comparações entre grupos)

Séries temporais (diagnósticos por mês)

Essas visualizações foram essenciais para complementar a análise numérica.

## 🧩 5. Conclusões Gerais

A análise do dataset permitiu identificar:

 ✔ Distribuições demográficas e clínicas relevantes
 
 ✔ Perfis de obsessão e compulsão predominantes
 
 ✔ Importância das comorbidades psiquiátricas no TOC
 
 ✔ Possíveis diferenças entre gêneros, estados civis e escolaridade
 
 ✔ Padrões temporais de diagnóstico

Apesar das limitações do dataset (como tamanho amostral e ausência de causalidade), os resultados mostram-se consistentes com literatura científica sobre TOC.

## 🔧 6. Tecnologias Utilizadas

PostgreSQL 18
pgAdmin
Power BI

## 📜 7. Licença

Verificar no Kaggle as condições de uso do dataset antes de redistribuição.
