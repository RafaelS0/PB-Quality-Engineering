#  Cinema Challenge Final

## 📋 Sobre o Projeto

O **Cinema Challenge Final** é um projeto dividido entre **frontend** e **backend**, desenvolvido para o gerenciamento e simulação de um sistema de cinema.

- **Backend:** (https://github.com/juniorschmitz/cinema-challenge-back)
- **Frontend:** (https://github.com/juniorschmitz/cinema-challenge-front)

---

## 🔍 Estrutura do Projeto


```bash
├── cinemaApps-tests/                 # Projetos de testes e documentação gerada durante o desenvolvimento
│   ├── api/                          # Projeto de testes para o Back-end
│   │   ├── keywords/                 # Palavras-chave relacionadas às funções de teste
│   │   ├── logs/                     # Logs gerados durante a execução dos testes
│   │   ├── support/                  # Funções de apoio reutilizáveis
│   │   │   ├── common/               # Funções genéricas
│   │   │   ├── fixtures/             # Arquivos JSON com dados de teste
│   │   │   ├── libs/                 # Bibliotecas auxiliares (ex: chamadas ao banco de dados)
│   │   │   └── variables/            # Variáveis globais
│   │   └── testes/                   # Suítes de testes executáveis
│   └── frontend/                     # Projeto de testes para o Front-end
│       ├── logs/                     # Logs das execuções
│       ├── resources/                # Recursos de teste (imagens, elementos, etc.)
│       └── testes/                   # Suítes de testes de interface
│
├── requirements.txt                  # Lista de dependências Python
└── README.md                         # Este arquivo

```

---




## 📊 Resultados dos Testes

### **Backend API Tests**
- **Total:** 50 testes
- **Taxa de Sucesso:** 0% (50/46 PASS)
- **Cobertura:** 53.6% dos endpoints


## 🛠️ Tecnologias Utilizadas

### **Framework de Testes**
- **Robot Framework** - Framework principal de automação
- **RequestsLibrary** - Testes de API
- **JSONLibrary** - Manipulação de dados JSON
- **Selenium** - Testes de interface web 

### **Linguagens e Ferramentas**
- **Python 3.12** - Linguagem base
- **Playwright** - Automação de browser
- **Pymongo** - Integração com o banco de dados MongoDB
