# NEXUS Empilhadeira

> Sistema de monitoramento, simulação e visualização de uma empilhadeira em miniatura.

## 1. Sobre o projeto

O **NEXUS Empilhadeira** é um projeto desenvolvido para acompanhar e demonstrar o funcionamento de uma empilhadeira em miniatura por meio de um dashboard interativo.

O sistema reúne informações operacionais, monitoramento ambiental, indicadores de bateria, histórico de utilização, alertas e visualização tridimensional do equipamento.

O projeto utiliza Python para executar o servidor e realizar a comunicação com o banco de dados MySQL.

## 2. Design e prototipagem

O design da interface do dashboard foi desenvolvido e prototipado no Figma.

**Acesse o projeto:**

[Dashboard Empilhadeira — Figma](https://www.figma.com/design/HSG0gjbjqXBlrZ0NL0Syh1/Dashboard-empiladeira?node-id=61-560&t=c90XBcuD0x2x3q5i-1)

## 3. Objetivos

- Monitorar o estado de funcionamento da empilhadeira.
- Acompanhar o nível de bateria.
- Registrar o tempo de operação.
- Monitorar a carga transportada.
- Apresentar temperatura e umidade.
- Identificar obstáculos próximos.
- Gerar alertas de condições anormais.
- Registrar ciclos de carga e descarga da bateria.
- Disponibilizar uma representação tridimensional do equipamento.
- Armazenar informações no banco de dados MySQL.

## 4. Tecnologias utilizadas

| Tecnologia | Aplicação |
|---|---|
| Python | Servidor e processamento de dados |
| MySQL | Armazenamento das informações |
| MySQL Connector | Comunicação Python/MySQL |
| HTML | Estrutura do dashboard |
| CSS | Estilização e interface |
| JavaScript | Interatividade e atualização dos dados |
| Canvas 2D | Representação visual do protótipo |
| SQL | Criação e gerenciamento do banco |

## 5. Estrutura do projeto

```text
Dashboard_Py/
│
├── app2_melhorado.py
├── banco_nexus_completo.sql
└── README.md
```

### Descrição dos arquivos

- `app2_melhorado.py`: aplicação principal, servidor HTTP, interface, comunicação com MySQL e funcionalidades do dashboard.
- `banco_nexus_completo.sql`: script de criação e configuração do banco de dados.
- `README.md`: documentação do projeto.

As imagens utilizadas na interface estão incorporadas ao próprio arquivo Python.

## 6. Funcionalidades do dashboard

### 6.1. Painel principal

Apresenta informações gerais sobre o equipamento:

- Estado atual: ligado ou desligado.
- Nível de bateria.
- Tempo de operação.
- Capacidade máxima de carga.
- Velocidade de deslocamento.

### 6.2. Monitoramento ambiental

- Temperatura em graus Celsius (°C).
- Umidade relativa do ar (%).
- Distância de obstáculos em centímetros (cm).

### 6.3. Sistema de alertas

| Condição | Alerta |
|---|---|
| Bateria igual ou inferior a 20% | Crítico |
| Obstáculo a até 15 cm | Crítico |
| Obstáculo entre 15 e 30 cm | Atenção |
| Carga superior a 500 g | Crítico |

### 6.4. Monitoramento da bateria

O sistema acompanha a variação do nível de bateria e registra os ciclos identificados como:

- Carga.
- Descarga.

Também apresenta o nível inicial, nível final, duração e situação de cada ciclo.

**Observação:** na versão atual, os ciclos são identificados a partir das variações simuladas da bateria.

### 6.5. Histórico de operações

O sistema registra eventos relacionados a:

- Estado do equipamento.
- Bateria.
- Elevação e carga.
- Velocidade.
- Temperatura.
- Umidade.

### 6.6. Modelo tridimensional

O projeto possui uma representação visual da empilhadeira, contendo:

- Chassi em acrílico.
- Torre de elevação.
- Garfos.
- Duas rodas.
- Motores DC.
- Servo motor e mecanismo de elevação.

O modelo permite girar a visualização em 360°, aproximar e afastar a câmera, alterar a perspectiva e controlar manualmente a altura dos garfos.

## 7. Banco de dados MySQL

O banco utilizado pelo projeto possui o nome:

```sql
empilhadeira
```

### 7.1. Tabela status_equipamento

Armazena o estado atual do equipamento.

Principais campos:

- `id`
- `nome`
- `status`
- `bateria`
- `elevacao`
- `tempo_operacao`
- `autonomia_max`
- `capacidade_max`
- `tempo_acumulado_seg`
- `ligado_desde`
- `velocidade`
- `temperatura`
- `umidade`
- `distancia`

### 7.2. Tabela componentes

Armazena informações dos componentes utilizados na construção do protótipo.

Campos:

- `id`
- `componente`
- `modelo`
- `detalhes`
- `link`

### 7.3. Tabela historico

Armazena os registros e eventos do equipamento.

Campos:

- `id`
- `horario`
- `registro`
- `categoria`
- `valor`
- `origem`

### 7.4. Tabela ciclos_bateria

Armazena os ciclos identificados de carga e descarga.

Campos:

- `id`
- `tipo`
- `inicio`
- `fim`
- `nivel_inicio`
- `nivel_fim`
- `duracao_seg`
- `estado`

## 8. Instalação e configuração

### 8.1. Requisitos

- Python instalado.
- MySQL Server instalado.
- MySQL Workbench (recomendado).
- Visual Studio Code (recomendado).
- Conexão local com o banco de dados.

### 8.2. Instalar a dependência

Abra o terminal do VS Code e execute:

```powershell
python -m pip install mysql-connector-python
```

### 8.3. Criar o banco de dados

1. Abra o MySQL Workbench.
2. Conecte-se ao servidor MySQL.
3. Abra o arquivo `banco_nexus_completo.sql`.
4. Execute o script.
5. Atualize a lista de Schemas.
6. Confira se o banco `empilhadeira` foi criado.

### 8.4. Configurar a conexão

O arquivo `app2_melhorado.py` utiliza as seguintes configurações padrão:

```python
DB_CONFIG = {
    'host': 'localhost',
    'user': os.getenv('DB_USER', 'root'),
    'password': os.getenv('DB_PASSWORD', 'root'),
    'database': 'empilhadeira',
    'port': 3306
}
```

Exemplo no PowerShell:

```powershell
$env:DB_USER="root"
$env:DB_PASSWORD="root"
```

### 8.5. Configurar o acesso ao painel

```powershell
$env:PANEL_USER="admin"
$env:PANEL_PASSWORD="Nexus@2026"
```

Recomenda-se alterar a senha antes de qualquer utilização fora do computador local.

## 9. Executar o projeto

Entre na pasta do projeto:

```powershell
cd "$HOME\Documents\Dashboard_Py"
```

Execute:

```powershell
python app2_melhorado.py
```

Acesse pelo navegador:

```text
http://127.0.0.1:8050
```

### Login padrão

```text
Usuário: admin
Senha: Nexus@2026
```

Para encerrar o servidor, pressione `CTRL + C`.

## 10. Comunicação entre Python e MySQL

A comunicação ocorre da seguinte maneira:

1. O usuário acessa o dashboard.
2. O Python inicia o servidor local.
3. O usuário realiza o login.
4. O Python consulta o banco de dados MySQL.
5. Os dados são enviados para a interface.
6. O dashboard atualiza as informações periodicamente.
7. As ações de interação e simulação podem atualizar os registros no banco.

A atualização dos dados da interface ocorre a cada 3 segundos.

### Rotas utilizadas

| Rota | Método | Finalidade |
|---|---|---|
| `/api/login` | POST | Autenticação |
| `/api/session` | GET | Verificação da sessão |
| `/api/data` | GET | Consulta dos dados |
| `/api/toggle` | POST | Alteração do estado |
| `/api/simular` | POST | Geração de leituras simuladas |
| `/api/logout` | POST | Encerramento da sessão |

As rotas protegidas exigem autenticação. As requisições POST autenticadas também utilizam token CSRF.

## 11. Simulação dos sensores

Na versão atual, os dados abaixo são gerados pelo próprio Python:

- Nível de bateria.
- Peso da carga.
- Velocidade.
- Temperatura.
- Umidade.
- Distância de obstáculos.

Os valores simulados são registrados no MySQL para permitir testar os gráficos, indicadores, histórico e alertas.

**Importante:** os valores apresentados ainda não representam leituras reais dos sensores físicos.

## 12. Segurança

O projeto possui mecanismos básicos de proteção:

- Tela de login.
- Autenticação por sessão.
- Cookie de sessão HttpOnly.
- Política SameSite Strict.
- Token CSRF nas requisições POST.
- Proteção das rotas da API.
- Configuração de credenciais por variáveis de ambiente.
- Servidor limitado ao endereço local `127.0.0.1`.

Para disponibilização em rede ou internet, são necessários controles adicionais, como HTTPS e armazenamento seguro de senhas.

## 13. Integrações futuras

As próximas etapas previstas para o projeto são:

- Integrar o ESP32 ao dashboard.
- Receber leituras reais do sensor DHT22.
- Receber leituras reais do sensor ultrassônico HC-SR04.
- Integrar as informações reais de bateria.
- Integrar a medição real de peso.
- Sincronizar os movimentos físicos com o modelo 3D.
- Aprimorar os relatórios e gráficos.
- Implementar comunicação segura entre o ESP32 e o servidor.

## 14. Considerações finais

O NEXUS Empilhadeira reúne recursos de monitoramento, visualização tridimensional, armazenamento de dados e simulação em uma única aplicação.

A utilização do Python em conjunto com o MySQL permite organizar as informações do equipamento, enquanto a interface web facilita a visualização dos indicadores e eventos.

O projeto foi estruturado para permitir futuras melhorias, principalmente a integração com sensores e componentes físicos, aproximando o dashboard do funcionamento real da empilhadeira em miniatura.

---

**Projeto:** NEXUS Empilhadeira

**Tecnologias principais:** Python, MySQL, HTML, CSS e JavaScript.

**Design:** [Acessar protótipo no Figma](https://www.figma.com/design/HSG0gjbjqXBlrZ0NL0Syh1/Dashboard-empiladeira?node-id=61-560&t=c90XBcuD0x2x3q5i-1)

**Versão:** Protótipo com monitoramento e simulação de dados.
