# Análise de E-commerce Brasileiro — Olist

## Sobre o projeto

Projeto de análise de dados desenvolvido com o objetivo de investigar o desempenho de vendas, o comportamento dos pedidos e a experiência dos clientes em um e-commerce brasileiro.

A análise utiliza dados públicos da Olist, explorados com SQL no Google BigQuery e apresentados por meio de um dashboard no Power BI.

## Objetivos

- Analisar a evolução mensal das vendas e dos pedidos.
- Identificar as categorias de produtos com maior valor vendido.
- Comparar o ticket médio entre os estados brasileiros.
- Investigar a ocorrência de atrasos nas entregas.
- Avaliar a relação entre o prazo de entrega e a satisfação dos clientes.

## Ferramentas utilizadas

- **Google BigQuery:** consultas e análise dos dados com SQL.
- **SQL:** agregações, CTEs, JOINs, funções condicionais e métricas.
- **Power BI:** construção do dashboard e visualização dos indicadores.

## Principais indicadores

| Indicador | Resultado |
|---|---:|
| Total de pedidos | 99.441 |
| Avaliações positivas (notas 4 e 5) | 77,07% |
| Avaliações negativas (notas 1 e 2) | 14,69% |
| Pedidos entregues com atraso | 8,11% |
| Nota média dos pedidos atrasados | 2,57 |
| Nota média dos pedidos no prazo ou antecipados | 4,29 |

## Principais análises e descobertas

- **Vendas por categoria:** categorias como saúde e beleza, relógios e presentes e cama, mesa e banho aparecem entre as de maior valor vendido.
- **Atrasos na entrega:** aproximadamente 8,11% dos pedidos entregues foram classificados como atrasados.
- **Experiência do cliente:** pedidos atrasados apresentaram nota média de 2,57, enquanto pedidos entregues no prazo ou antecipadamente tiveram média de 4,29.
- **Análise geográfica:** comparação do ticket médio e dos percentuais de atraso entre os estados brasileiros.

Os resultados indicam uma associação entre atrasos na entrega e avaliações menos favoráveis. Essa relação não deve ser interpretada, isoladamente, como prova de causalidade.

## Estrutura do repositório

```text
analise-ecommerce-olist/
├── SQL/
│   ├── 02_vendas_mensais.sql
│   ├── 03_vendas_por_categoria.sql
│   ├── 04_ticket_medio_por_estado.sql
│   ├── 05_atrasos_por_estado.sql
│   ├── 06_atraso_vs_avaliacao.sql
│   └── README.md
└── README.md
```

## Fonte dos dados

Dataset público da **Brazilian E-Commerce Public Dataset by Olist**, disponibilizado no Kaggle.

## Observações

Os dados abrangem o período de 2016 a 2018. O último mês de 2018 possui dados parciais, portanto deve ser interpretado com cautela nas comparações mensais.

O indicador de valor vendido representa a soma dos valores dos produtos nos pedidos, não o lucro da empresa.

## Competências desenvolvidas

- Consulta e exploração de dados com SQL.
- Manipulação e relacionamento de tabelas.
- Construção de indicadores de negócio.
- Análise exploratória de dados.
- Desenvolvimento de dashboards no Power BI.
- Comunicação de resultados por meio de visualizações.

---

**Projeto desenvolvido para fins de estudo e construção de portfólio na área de Dados.**
