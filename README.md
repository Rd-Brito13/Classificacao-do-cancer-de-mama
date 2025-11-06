
# Classificação do Câncer de Mama

Este projeto aplica **técnicas de Machine Learning** e **Redes Neurais Artificiais (MLP)** para prever se um tumor é **maligno** ou **benigno**, utilizando o dataset público *Breast Cancer Wisconsin (Diagnostic)* disponível no Kaggle: https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data

O objetivo é oferecer uma solução que **apoie o diagnóstico precoce** do câncer de mama, fornecendo insights rápidos e precisos a partir de variáveis obtidas em exames clínicos.

---

## Objetivo do Projeto
Desenvolver **modelos preditivos de alta precisão** capazes de:
- Apoiar a **tomada de decisão médica**.
- Minimizar **falsos negativos** (malignos classificados como benignos).
- Demonstrar o uso prático de diferentes algoritmos supervisionados de classificação.

---


## Estrutura do repositório

Classificacao-do-cancer-de-mama/

├─ data/

│  ├─ raw/ <- dados_cancer.csv

│  └─ processed/ <- dados_cancer_tratado.csv

├─ notebooks/

│  └─ Classificador.ipynb <- Análise, tratamento e modelagem dos dados

├─ models/ <- Modelos treinados (MLP.pkl, SVM.pkl, LG.pkl)

├─ requirements/ 

│ └─ requirements.txt <- Dependências do projeto

├─ Setup.bat <- Script de configuração automática do ambiente
│

└─ README.md <- Documentação do projeto

---

## Dataset

**Fonte:** [Kaggle - Breast Cancer Wisconsin (Diagnostic) Data Set](https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data)

- **Instâncias:** 569  
- **Features:** 30 variáveis numéricas extraídas de imagens digitalizadas de tumores  
- **Target:**  
  - `0` → Benigno  
  - `1` → Maligno  


---

# Pipeline do Projeto

### Importação e Tratamento dos Dados
- Leitura da base de dados original (.csv)  
- Análise exploratória: distribuição das variáveis, valores ausentes, frequência das classes e detecção de outliers  
- Codificação (`LabelEncoder`) do target  
- Escalonamento e padronização das features numéricas  
- Separação de treino e teste **antes** do pré-processamento para evitar *data leakage*  

### Modelagem e Treinamento
Modelos testados:
- Naive Bayes
- Decision Tree Classifier  
- Random Forest  
- XGBoost / LightGBM / CatBoost
- KNN
- Logistic Regression  
- Multi-Layer Perceptron (MLPClassifier)  
- Support Vector Machine (SVC)  


### Otimização e Validação
- Ajuste de hiperparâmetros utilizando: `GridSearchCV - RandomizedSearchCV`, a busca foi otimizada utilizando a variavel `recall_maligno`, visando trazer o melhor recall para o falso negativo (malignos classificados como benignos)
- Validação cruzada (`cross_validate - kfold`)  
- Métricas de desempenho:
  - **Accuracy Global**
  - **Precision médio (Falso Negativo)**
  - **Recall Médio (Falso Negativo)**
  - **F1-Score Médio (Falso Negativo)**
  - **ROC-AUC Global**
  - **Matriz de Confusão Interativa (Plotly)**

  
### Simulação de deploy

A simulação de deploy foi planejada para testar a aplicação prática dos três modelos finalistas.
O processo envolveu:

   - Carregamento dos modelos treinados (.pkl) diretamente do diretório notebooks/
   - Replicação do pipeline de pré-processamento, garantindo consistência no escalonamento e codificaçã
   - importa os 3 arquivos
   - Entrada de novos dados simulados representando pacientes com características clínicas reais (no formato de dataframe)
   - Predição automática (Benigno/Maligno) e exibição das probabilidades associadas

---

### Comparativo de Desempenho — Modelos de Destaque

   - Suport Vector Machines (SVC): Acurácia Global: 97.66%, Recall Médio (Maligno): 96.83%, Excelente separação entre classes após escalonamento. Indicado para máxima taxa de acertos globais.
   - Logistic Regression (LG) AUC-ROC Global: 99.67%, Recall (Maligno): 96.67%, Simples, interpretável e estável. Desempenho comparável a modelos complexos.
   - Multi-Layer Perceptron (MLP), AUC-ROC Global: 99.72%, F1-Score Médio (Maligno): 96.18%, Precision Médio (Maligno): 96.85%, Modelo mais expressivo nas métricas médias. Ótimo equilíbrio entre precisão e sensibilidade.

Os resultados indicam que, embora todos apresentem alta acurácia, cada modelo se sobressai em um aspecto específico:

   - O SVM é o mais confiável em termos de acertos globais.
   - A Regressão Logística é a opção mais interpretável e estável.
   - O MLP é o mais poderoso na detecção de padrões complexos, alcançando o melhor F1 médio.ame
  
Entre os três modelos de destaque, o Support Vector Machine (SVM) foi selecionado como o modelo de referência principal para a etapa de deploy.
A escolha se baseou em Quatro pilares técnicos:

   - Estabilidade, apresentou menor variação entre as dobras da validação cruzada.
   - Equilíbrio entre recall e acurácia, reduzindo o risco de falsos negativos sem comprometer o desempenho global.
   - Generalização sólida, mantendo resultados consistentes mesmo com ajustes mínimos nos hiperparâmetros.
   - Menor erro ao classificar Falso Negativo (Maligno como benigno) e Verdadeiro Negativo (Benigno como Maligno)

Embora o MLP tenha alcançado métricas próximas ou até superiores em alguns aspectos, o SVM se mostrou mais previsível e estável, características ideais para uso clínico ou em pipelines de produção.
   

---

## Como executar o projeto
Obs: Ao utilizar o google colab para executar o projeto, certificar de instalar as bibliotecas de (XGboost, LightGBM, Catboost) e alterar os caminhos para importação da base de dados
1. Clone este repositório:

```bash
git clone https://github.com/Rd-Brito13/Classificacao-do-cancer-de-mama.git
cd Classificacao-do-cancer-de-mama

2. Executar Setup.bat:
Executar o Setup.bat para criar e inicar o ambiente (criando a pasta env), inicar, instalar os requeriments, criar o kernel Phyton (Cancer de Mama)

3. Selecionar o Kernel no jupyter
Kernel -> Change Kernel -> Python (Cancer de Mam)

4. Execute o notebook
-Abra o notebook notebooks/Classificador.ipynb no Jupyter Notebook
```

---
## 👨‍💻 Autor

**Rodrigo Brito**  
📧 [rd.brito13@gmail.com](mailto:rd.brito13@gmail.com)  
💼 [LinkedIn](https://www.linkedin.com/in/rd-brito13)

---

⭐ **Se este projeto foi interessante, não esqueça de deixar uma estrela no repositório!**
