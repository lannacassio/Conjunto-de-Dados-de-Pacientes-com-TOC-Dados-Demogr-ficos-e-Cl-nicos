SELECT *
FROM ocd_patients;


# -- 1. Contagem e porcentagem de mulheres versus homens com TOC e -- Pontuação média de obsessão por gênero

WITH resumo AS (
    SELECT 
        Gender,
        COUNT(patient_id) AS total,
        AVG(ybocs_obs) AS media
    FROM ocd_patients
    GROUP BY Gender
)
SELECT 
    Gender as genero,
    total AS contagem_paciente,
    ROUND(media, 2) AS media_obs_score,
    ROUND((total::NUMERIC / SUM(total) OVER()) * 100, 2) || '%' AS percentage
FROM resumo
ORDER BY total DESC;

# -- 2. Número de pacientes por etnia e suas respectivas pontuações médias de obsessão.

select 
	ethnicity as etnia,
	count(patient_id) as qtd_pacientes,
	round(avg(ybocs_obs),2) as media_obsessao

from ocd_patients
Group By ethnicity
Order By qtd_pacientes

# -- 3. Número de pessoas diagnosticadas com TOC (Mês)
-- Mês/Ano
select
	TO_CHAR(ocd_diagnosis_date, 'YYYY-MM') as mes_ano,
	count(patient_id) as qtd_pacientes
from ocd_patients
GROUP BY TO_CHAR(ocd_diagnosis_date, 'YYYY-MM')
Order BY mes_ano
-- Mês
select
	TO_CHAR(ocd_diagnosis_date, 'MM') as mes,
	count(patient_id) as qtd_pacientes
from ocd_patients
GROUP BY TO_CHAR(ocd_diagnosis_date, 'MM')
Order BY mes

# -- 4. Qual é o tipo de obsessão mais comum (em número) e qual é a sua respectiva pontuação média de obsessão?

WITH obs as (
	SELECT 
		obsession_type,
		count(patient_id) as total,
		avg(ybocs_obs) as avg_obsessao
	FROM ocd_patients
	GROUP BY obsession_type
)

SELECT 
	obsession_type as tipo_compulsao,
	total as qtd_pacientes,
	round(avg_obsessao,2) as media_obsessao,
	round((total :: NUMERIC / sum(total) OVER()) * 100 ,2) || '%' as perc_obsessao
FROM obs
ORDER BY qtd_pacientes DESC

# -- 5. Qual é o tipo de compulsão mais comum (em número) e sua respectiva pontuação média de obsessão?

with comp as (
	SELECT 
		compulsion_type,
		count(patient_id) as total,
		avg(ybocs_comp) as comp
	FROM ocd_patients
	GROUP BY compulsion_type
)

SELECT
	compulsion_type as tipo_compulsao,
	total as qtd_pacientes,
	round(comp,2) as media_compulsao,
	round((total :: NUMERIC / sum(total) OVER()) *100,2) || '%' AS perc_compulsao
FROM comp
ORDER BY qtd_pacientes DESC


# -- 6. Qual a porcentagem de pacientes que enfrentam TOC junto com Depressão, Ansiedade, ou ambos?

with comordidade AS (

	SELECT 
		CASE
			WHEN depression_diagnosis = 'Yes' AND anxiety_diagnosis = 'Yes' THEN 'Depressão e Anxiedade'
			WHEN depression_diagnosis = 'Yes' AND anxiety_diagnosis = 'No' THEN 'Apenas Depressão'
			WHEN depression_diagnosis = 'No' AND anxiety_diagnosis = 'Yes' THEN 'Apenas Anxiedade'
			ELSE 'Nenhuma Comordidade'
		END AS perfil_clinico,
		count(patient_id) as total,
		avg(ybocs_obs + ybocs_comp) AS media_pontuacao
	FROM ocd_patients
	GROUP BY perfil_clinico

)
SELECT 
	perfil_clinico,
	total as qtd_pacientes,
	round(media_pontuacao,2) AS pontuacao_media,
	round((total :: NUMERIC / sum(total) OVER() * 100),2) || '%' AS perc_comordidade
FROM comordidade
Order By qtd_pacientes

# -- 7. Existe um tipo de obsessão dominante para cada nível de educação?

SELECT 
	education_level as educacao,
	obsession_type as tipo_obsessao,
	qtd_pacientes
	
	
FROM (

	SELECT count(patient_id) AS qtd_pacientes,
	obsession_type,
	education_level,
	RANK() OVER(PARTITION BY education_level ORDER BY count(patient_id) DESC) AS ranking
-- Rank() e OVER() são indispensáveis, Partition é para contabilizar cada nível de educação
	FROM ocd_patients
	GROUP BY education_level, obsession_type
) sub_query
ORDER BY qtd_pacientes DESC


# -- 8. Pacientes casados apresentam pontuações de obsessão (Y-BOCS) menores do que solteiros ou divorciados?

SELECT 
	marital_status as estado_matrimonial,
	round(avg(ybocs_obs),2) as media_obsessao,
	round(avg(ybocs_comp),2) as media_compulsao,
	round(avg(ybocs_obs + ybocs_comp),2) as media_geral
FROM ocd_patients
GROUP BY marital_status
ORDER BY media_geral DESC

# -- 9. Pessoas com obsessões do tipo "Harm-related" (Dano) possuem maior incidência de Depressão do que aquelas com "Symmetry" (Simetria)?

SELECT 
	obsession_type as tipo_depressao,
	COUNT(patient_id) as qtd_pacientes,
	round((COUNT(patient_id) :: NUMERIC / sum(count(patient_id)) OVER()) *100,2) || '%' perc_depressao
FROM ocd_patients
WHERE depression_diagnosis = 'Yes'
GROUP BY obsession_type
ORDER BY perc_depressao DESC

# -- 10. Qual é a combinação de Gênero + Estado Civil com a maior pontuação média de Y-BOCS?

SELECT
	gender,
	marital_status,
	round(avg(ybocs_obs + ybocs_comp),2) as media_pontuacao
FROM ocd_patients
GROUP BY gender, marital_status
ORDER BY media_pontuacao DESC