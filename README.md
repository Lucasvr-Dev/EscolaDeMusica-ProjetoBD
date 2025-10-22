# 🎵 Escola de Música - Sistema de Gerenciamento

Sistema de banco de dados desenvolvido para gerenciar orquestras, músicos, instrumentos, sinfonias e suas relações em uma escola de música.

## 📋 Descrição do Projeto

Este projeto consiste em um banco de dados relacional completo para gerenciar todas as operações de uma escola de música, incluindo:

- Cadastro de orquestras e músicos
- Registro de instrumentos e suas categorias
- Controle de sinfonias e compositores
- Relacionamento entre músicos, funções e instrumentos
- Acompanhamento de apresentações e avaliações de desempenho
- Relatórios e estatísticas diversas

## 🗂️ Estrutura do Banco de Dados

### Tabelas Principais

- **Orquestras**: Informações sobre as orquestras (nome, cidade, país, data de criação, contato)
- **Musicos**: Dados dos músicos (nome, identidade, nacionalidade, salário, status)
- **Instrumentos**: Catálogo de instrumentos musicais disponíveis
- **FuncoesDosMusicos**: Funções desempenhadas pelos músicos (maestro, violinista, flautista, etc.)
- **Sinfonias**: Registro de sinfonias (compositor, data de composição, gênero, dificuldade)

### Tabelas de Relacionamento

- **Tocam**: Relaciona músicos aos instrumentos que sabem tocar
- **Executam**: Relaciona orquestras às sinfonias que executam
- **Desempenham**: Relaciona músicos às funções que desempenham
- **Atuam**: Relacionamento completo entre músicos, sinfonias, funções e instrumentos

## 📁 Estrutura de Arquivos

```
EscolaDeMusica_SenacBD/
│
├── Scripts/
│   ├── EscolaDeMusica.sql           # Criação do banco e tabelas (DDL)
│   ├── InsertInto.sql               # Inserção de dados iniciais (DML)
│   ├── AlterTables.sql              # Alterações nas tabelas (DDL)
│   ├── Update_DeleteTables.sql      # Updates e deletes (DML)
│   ├── CreateView.sql               # Criação de views
│   ├── Consultas_Perguntas_Relatorios.sql  # Consultas úteis
│   └── DeleteTables.sql             # Remoção do banco (DDL)
```

## 🚀 Como Utilizar

### Pré-requisitos

- MySQL Server 5.7 ou superior
- Cliente MySQL (MySQL Workbench, DBeaver, ou linha de comando)

### Instalação

1. **Criar o banco de dados e estrutura:**
   ```sql
   source EscolaDeMusica.sql
   ```

2. **Adicionar colunas extras:**
   ```sql
   source AlterTables.sql
   ```

3. **Popular o banco com dados iniciais:**
   ```sql
   source InsertInto.sql
   ```

4. **Aplicar atualizações nos dados:**
   ```sql
   source Update_DeleteTables.sql
   ```

5. **Criar views para consultas:**
   ```sql
   source CreateView.sql
   ```

### Ordem de Execução Recomendada

1. `EscolaDeMusica.sql` - Estrutura base
2. `AlterTables.sql` - Modificações estruturais
3. `InsertInto.sql` - Dados iniciais
4. `Update_DeleteTables.sql` - Atualizações
5. `CreateView.sql` - Views para relatórios
6. `Consultas_Perguntas_Relatorios.sql` - Exemplos de consultas

## 📊 Funcionalidades Principais

### Consultas Disponíveis

- ✅ Artistas que tocam múltiplos instrumentos
- ✅ Sinfonias por compositor
- ✅ Instrumentos mais utilizados
- ✅ Maestros e suas sinfonias
- ✅ Músicos por orquestra com total de sinfonias
- ✅ Avaliações de desempenho por sinfonia
- ✅ Estatísticas salariais por orquestra
- ✅ Sinfonias por dificuldade e apresentações
- ✅ Compositores mais executados

### Views Criadas

- `vw_musicos_orquestras` - Músicos e suas orquestras
- `vw_musicos_instrumentos` - Músicos e instrumentos que tocam
- `vw_sinfonias_orquestras` - Sinfonias e orquestras executoras
- `vw_atuacoes_completas` - Visão completa das atuações
- `vw_estatisticas_orquestra` - Estatísticas por orquestra
- `vw_musicos_faixa_salarial` - Distribuição salarial
- `vw_instrumentos_categoria_preco` - Análise de instrumentos
- `vw_sinfonias_dificuldade` - Sinfonias por nível de dificuldade
- `vw_orquestras_status_regiao` - Orquestras por região e status
- `vw_performance_artistas` - Performance individual dos músicos

## 🎯 Características Técnicas

### Campos Principais Adicionados

- **Orquestras**: email, status (ativa/inativa/suspenso)
- **Músicos**: telefone, endereço, salário, status (ativo/inativo/licença)
- **Instrumentos**: categoria, preço
- **Sinfonias**: duração, dificuldade (baixa/média/alta/muito_alta)
- **Tocam**: nível de proficiência (iniciante/intermediário/avançado/expert)
- **Executam**: data estreia, número de apresentações
- **Atuam**: data fim, avaliação de desempenho

### Integridade Referencial

- Chaves estrangeiras com `ON DELETE CASCADE` para tabelas de relacionamento
- Chaves estrangeiras com `ON DELETE SET NULL` para relações opcionais
- Constraints de unicidade para evitar duplicações
- Valores ENUM para padronização de dados

## 📈 Estatísticas do Banco

- **20 Orquestras** cadastradas em diversas cidades brasileiras
- **22 Músicos** com informações completas
- **20 Instrumentos** diferentes catalogados
- **21 Funções** musicais disponíveis
- **20 Sinfonias** de compositores clássicos renomados

## ⚠️ Importante

- O arquivo `DeleteTables.sql` deve ser usado com **extrema cautela**, pois remove completamente o banco de dados
- Sempre faça backup antes de executar operações de DELETE ou DROP
- Os scripts de UPDATE contêm alguns DELETEs comentados para segurança

## 🔧 Manutenção

Para remover completamente o banco de dados e recomeçar:

```sql
source DeleteTables.sql
```

**⚠️ ATENÇÃO:** Esta operação é irreversível e apagará todos os dados!

## 👥 Equipe de Desenvolvimento

* **Lucas Vinicius**
* **Renan Souza**
* **Vitória Barboza**

---

Sistema desenvolvido para fins educacionais - Escola de Música SENAC 🎵
