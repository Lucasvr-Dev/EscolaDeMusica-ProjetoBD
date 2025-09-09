# Sistema de Gestão de Escola de Música 🎼

Um sistema de banco de dados completo para gerenciar uma escola de música, incluindo orquestras, músicos, instrumentos, sinfonias e suas inter-relações.

## 📋 Descrição do Projeto

Este projeto implementa um sistema de gestão para uma escola de música que permite controlar:

- **Orquestras** e suas informações básicas
- **Músicos** e suas vinculações às orquestras
- **Instrumentos** musicais disponíveis
- **Sinfonias** e suas composições
- **Funções** que os músicos podem desempenhar
- **Relacionamentos** complexos entre todas essas entidades

## 🗂️ Estrutura do Banco de Dados

### Modelo Conceitual (ER)
O primeiro diagrama mostra o modelo entidade-relacionamento com as seguintes entidades principais:

- **Orquestras**: Informações das orquestras (nome, cidade, país, data de fundação)
- **Músicos**: Dados dos músicos (nome, identidade, nacionalidade, data de nascimento)
- **Instrumentos**: Catálogo de instrumentos musicais
- **Sinfonias**: Repertório de sinfonias (nome, compositor, data de composição)
- **Funções dos Músicos**: Papéis que os músicos podem exercer

### Modelo Lógico/Físico
O segundo diagrama apresenta a implementação física com:

- Chaves primárias e estrangeiras definidas
- Tipos de dados especificados (VARCHAR, DATE, etc.)
- Relacionamentos N:N implementados através de tabelas associativas

## 🔗 Principais Relacionamentos

### Relacionamentos muitos para muitos (N:N)
- **Executam**: Orquestras ↔ Sinfonias
- **Tocam**: Músicos ↔ Instrumentos  
- **Desempenham**: Músicos ↔ Funções
- **Atuam**: Relação complexa (Músicos, Sinfonias, Funções, Instrumentos)

### Relacionamentos um para muitos (1:N)
- **Orquestras** → **Músicos** (cada músico pertence a uma orquestra)

## 📁 Estrutura dos Arquivos

```
EscolaDeMusica_SenacBD/
├── EscolaDeMusica.sql          # Criação do banco e tabelas principais
├── InsertInto.sql              # Dados iniciais de exemplo
├── AlterTables.sql             # Modificações estruturais das tabelas
├── Consultas_Perguntas_Relatorios.sql  # Queries de consulta e relatórios
├── CreateView.sql              # Views para facilitar consultas
├── Update_DeleteTables.sql     # Operações de atualização e exclusão
└── DeleteTables.sql            # Script para limpeza do banco
```

## 🚀 Como Usar

### 1. Configuração Inicial
```sql
-- Execute os scripts na seguinte ordem:
1. EscolaDeMusica.sql       # Cria o banco e estrutura inicial
2. InsertInto.sql           # Popula com dados de exemplo
3. AlterTables.sql          # Aplica modificações estruturais
4. CreateView.sql           # Cria views para consultas
```

### 2. Principais Funcionalidades

#### Consultas Disponíveis
- Lista de músicos com suas orquestras
- Músicos e instrumentos que sabem tocar
- Sinfonias e orquestras que as executam
- Contagem de músicos por orquestra
- Músicos que tocam múltiplos instrumentos
- Funções desempenhadas por músico específico
- Instrumentos mais utilizados nas sinfonias

#### Views Criadas
- `vw_musicos_orquestras`: Músicos com suas orquestras
- `vw_musicos_instrumentos`: Músicos e seus instrumentos
- `vw_sinfonias_orquestras`: Sinfonias com orquestras executoras
- `vw_atuacoes`: Detalhes completos das atuações
- `vw_total_musicos_orquestra`: Estatísticas por orquestra
- `vw_instrumentos_populares`: Instrumentos mais utilizados
- `vw_maestros`: Músicos que atuaram como maestros

## 🔧 Características Técnicas

### Tipos de Dados Utilizados
- `INT AUTO_INCREMENT`: Para chaves primárias
- `VARCHAR(n)`: Para textos variáveis
- `DATE`: Para datas
- `ENUM`: Para campos com valores predefinidos (instrumentos, funções)

### Modificações Estruturais Implementadas
- Renomeação da tabela `Musicos` para `Artistas`
- Adição de campos (`email`, `telefone`, `generoMusical`)
- Modificação de tipos de dados
- Criação de índices para otimização
- Alteração de campos para ENUM com validação

### Integridade Referencial
- Chaves estrangeiras garantem consistência dos dados
- Relacionamentos bem definidos entre todas as entidades
- Cascata de operações onde apropriado

## 📊 Relatórios Disponíveis

O sistema oferece diversos relatórios pré-configurados:

- **Estatísticos**: Contagens e agrupamentos
- **Relacionais**: Cruzamento de informações entre tabelas
- **Filtrados**: Consultas com critérios específicos
- **Agregados**: Dados consolidados e sumarizados

## 🛠️ Tecnologias Utilizadas

- **SGBD**: MySQL
- **Linguagem**: SQL
- **Modelagem**: Diagrama Entidade-Relacionamento (ER)

## 📈 Possíveis Extensões

- Sistema de agenda de apresentações
- Controle de repertório por temporada
- Histórico de carreiras dos músicos
- Sistema de avaliação de performances
- Integração com sistema de pagamentos
- Dashboard web para visualização de dados

## 🤝 Como Contribuir

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 👥 Equipe de Desenvolvimento

- **Lucas Vinicius**
- **Renan Souza**  
- **Vitória Barboza**

## ✨ Créditos

Desenvolvido como projeto acadêmico para demonstrar conceitos de:
- Modelagem de banco de dados
- Relacionamentos complexos
- Consultas SQL avançadas
- Normalização de dados
- Integridade referencial

---
*Sistema desenvolvido para fins educacionais - Escola de Música SENAC* 🎵

