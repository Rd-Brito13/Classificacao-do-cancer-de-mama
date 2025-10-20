
# Projeto: Classificação do Câncer de Mama

Este projeto utiliza **Machine Learning** e **Rede Neural MLP (Multi-Layer Perceptron)** para prever se um tumor é maligno ou benigno, baseado no dataset público do [Kaggle](https://www.kaggle.com/datasets/uciml/breast-cancer-wisconsin-data).

---

## Objetivo do projeto

Desenvolver modelos preditivos capazes de auxiliar na detecção precoce do câncer de mama, apoiando a tomada de decisão médica, a partir de variáveis numéricas obtidas por exames clínicos.
---

## Estrutura do repositório

Classificacao-do-cancer-de-mama/

├─ data/

│  ├─ raw/ <- dados_cancer.csv

│  └─ processed/ <- dados_cancer_tratado.csv

├─ notebooks/
│  └─ Classificador.ipynb <- Análise, tratamento e modelagem

├─ models/ <- MLP.pkl, Regressao_Logistica.pkl, SVM.pkl

├─ requirements/ <- requirements.txt com dependências do projeto

├─ Setup.bat <- Script para configurar ambiente, instalar os requeriments e criar um kernel para utilizar o jupyter já com os requeriments instalados

└─ README.md <- Documentação do projeto

---

## Dataset

- **Fonte**: Kaggle - Breast Cancer Wisconsin (Diagnostic) Data Set  
- **Número de instâncias**: 569  
- **Número de features**: 30 variáveis extraídas de imagens digitalizadas de tumores  
- **Target**:
  - 1 - Benigno
  - 0 - Maligno

---

## Pipeline do projeto

1. **Importação dos dados**  
   - Carregamento do dataset (CSV do Kaggle)  

2. **Exploração e tratamento dos dados**  
   - Análise exploratória (distribuição das variáveis, valores ausentes, frequência das classes, análise gráfica dos dados, outliers)  
   - Encoding (LabelEncoder) para o target  
   - Escalonamento/Padronização das features  
   - Separação de treino e teste antes do pré-processamento (evitar vazamento de dados)  

3. **Modelagem**  
   - Modelos testados:
     - Árvore de decisão
     - Random Forest
     - XGBoost, LightGBM, CatBoost
     - Rede Neural MLPClassifier
   - Ajuste de hiperparâmetros com GridSearchCV  

4. **Validação**  
   - Separação treino/teste  
   - Cross-validation para estimativa de performance  
   - Métricas de desempenho: **Accuracy, Precision, Recall, F1-score, ROC-AUC, Confusion Matrix**  

5. **Salvar Modelos**  
   - Modelos finais salvos em `models/` (MLP.pkl, Regressão Logística.pkl, SVM.pkl)  

6. **Simulação de deploy**  
   - Carregamento do modelo salvo e realização de previsões em novos dados  

---

## Resultados

- Melhor modelo: **Máquina de Vetores de Suporte (SVM)** com features escalonadas  
- Principais métricas:
  - Accuracy: **98,25%**
  - Precision: **98%**
  - Recall: **99%**
  - F1-score: **99%**
  - Confusion Matrix: **168 acertos**
  - Validação cruzada: **97,54%**

---

## Como executar o projeto
Obs: Ao utilizar o google colab para executar o projeto, certificar de instalar as bibliotecas de (XGboost, LightGBM, Catboost) e alterar os caminhos para importação da base de dados
1. Clone este repositório:

```bash
git clone https://github.com/Rd-Brito13/Classificacao-do-cancer-de-mama.git
cd Classificacao-do-cancer-de-mama

2. Executar Setup.bat:
Executar o Setup.bat para criar e inicar o ambiente (criando a pasta env), inicar, instalar os requeriments, criar o kernel Phyton (Cancer-ML)

3. Selecionar o Kernel no jupyter
Kernel -> Change Kernel -> Python (Cancer-ML)

4. Execute o notebook
-Abra o notebook notebooks/Classificador.ipynb no Jupyter Notebook
```

---
## 👨‍💻 Autor

**Rodrigo Brito**  
📧 [rd.brito13@gmail.com](mailto:rd.brito13@gmail.com)  
💼 [LinkedIn](https://www.linkedin.com/in/rd-brito13)

---

⭐ **Se este projeto foi útil, não esqueça de deixar uma estrela no repositório!**
