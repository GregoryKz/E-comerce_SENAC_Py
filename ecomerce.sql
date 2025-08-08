-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08/08/2025 às 02:58
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecomerce`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `ID` int(11) NOT NULL,
  `Cliente_ID` int(11) DEFAULT NULL,
  `Produto_ID` int(11) DEFAULT NULL,
  `Quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `celular`
--

CREATE TABLE `celular` (
  `Produto_ID` int(11) NOT NULL,
  `Chip` varchar(100) DEFAULT NULL,
  `Memoria` varchar(100) DEFAULT NULL,
  `Camera` varchar(100) DEFAULT NULL,
  `Fone` varchar(100) DEFAULT NULL,
  `Carregador` varchar(100) DEFAULT NULL,
  `Sistema_Operacional` varchar(100) DEFAULT NULL,
  `Polegadas` decimal(4,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(20) NOT NULL,
  `RG` varchar(20) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Endereco` text DEFAULT NULL,
  `Senha` varchar(255) DEFAULT NULL,
  `Cartao` varchar(100) DEFAULT NULL,
  `CEP` varchar(20) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Idade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`ID`, `Nome`, `CPF`, `RG`, `Email`, `Endereco`, `Senha`, `Cartao`, `CEP`, `Celular`, `Sexo`, `Idade`) VALUES
(1, 'Ana Costa', '123.456.789-10', NULL, 'ana@email.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Gregory', '123456.78999', NULL, 'gregory.kspereira@senacsp.edu.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Marcelo', '88888888831', NULL, 'marcelozarato@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `ID` int(11) NOT NULL,
  `Frete` decimal(10,2) DEFAULT NULL,
  `Codigo_Promocional` varchar(100) DEFAULT NULL,
  `Cliente_ID` int(11) DEFAULT NULL,
  `Loja_ID` int(11) DEFAULT NULL,
  `Pagamento_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `compra`
--

INSERT INTO `compra` (`ID`, `Frete`, `Codigo_Promocional`, `Cliente_ID`, `Loja_ID`, `Pagamento_ID`) VALUES
(1, 10.00, NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrega`
--

CREATE TABLE `entrega` (
  `ID` int(11) NOT NULL,
  `Prazo` int(11) DEFAULT NULL,
  `Codigo_Rastreio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `entrega`
--

INSERT INTO `entrega` (`ID`, `Prazo`, `Codigo_Rastreio`) VALUES
(1, 5, 'ABC123BR');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico`
--

CREATE TABLE `historico` (
  `ID` int(11) NOT NULL,
  `Cliente_ID` int(11) DEFAULT NULL,
  `Pedido_ID` int(11) DEFAULT NULL,
  `Data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico`
--

INSERT INTO `historico` (`ID`, `Cliente_ID`, `Pedido_ID`, `Data`) VALUES
(1, 1, 1, '2025-08-06 20:16:39');

-- --------------------------------------------------------

--
-- Estrutura para tabela `loja`
--

CREATE TABLE `loja` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Estoque` int(11) DEFAULT NULL,
  `CNPJ` varchar(20) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Endereco` text DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Verificado` tinyint(1) DEFAULT NULL,
  `Avaliacao` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `loja`
--

INSERT INTO `loja` (`ID`, `Nome`, `Estoque`, `CNPJ`, `Telefone`, `Endereco`, `Email`, `Tipo`, `Verificado`, `Avaliacao`) VALUES
(1, 'TechStore', NULL, '12.345.678/0001-90', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notebook`
--

CREATE TABLE `notebook` (
  `Produto_ID` int(11) NOT NULL,
  `Armazenamento` varchar(100) DEFAULT NULL,
  `Sistema_Operacional` varchar(100) DEFAULT NULL,
  `RAM` varchar(50) DEFAULT NULL,
  `Placa_Video` varchar(100) DEFAULT NULL,
  `Polegadas` decimal(4,1) DEFAULT NULL,
  `Camera` varchar(100) DEFAULT NULL,
  `Touch` tinyint(1) DEFAULT NULL,
  `Teclado` varchar(100) DEFAULT NULL,
  `Conectores` varchar(255) DEFAULT NULL,
  `Expansivo` tinyint(1) DEFAULT NULL,
  `Cooler` tinyint(1) DEFAULT NULL,
  `Alto_falante` varchar(100) DEFAULT NULL,
  `Resolucao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `ID` int(11) NOT NULL,
  `Tipo` enum('Boleto','PIX','Cartao_Credito','Cartao_Debito') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`ID`, `Tipo`) VALUES
(1, 'PIX');

-- --------------------------------------------------------

--
-- Estrutura para tabela `panela`
--

CREATE TABLE `panela` (
  `Produto_ID` int(11) NOT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Kit` tinyint(1) DEFAULT NULL,
  `Antiaderente` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `ID` int(11) NOT NULL,
  `Compra_ID` int(11) DEFAULT NULL,
  `Entrega_ID` int(11) DEFAULT NULL,
  `Status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`ID`, `Compra_ID`, `Entrega_ID`, `Status`) VALUES
(1, 1, 1, 'Aguardando envio');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `ID` int(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `Desconto` decimal(5,2) DEFAULT NULL,
  `Descricao` text DEFAULT NULL,
  `Valor` decimal(10,2) NOT NULL,
  `Avalicao` decimal(2,1) DEFAULT NULL,
  `Quantidade_Compra` int(11) DEFAULT NULL,
  `Imagens` text DEFAULT NULL,
  `Material` varchar(100) DEFAULT NULL,
  `Marca` varchar(100) DEFAULT NULL,
  `Cor` varchar(50) DEFAULT NULL,
  `Tamanho` varchar(50) DEFAULT NULL,
  `Peso` decimal(10,2) DEFAULT NULL,
  `Lote` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`ID`, `Nome`, `Desconto`, `Descricao`, `Valor`, `Avalicao`, `Quantidade_Compra`, `Imagens`, `Material`, `Marca`, `Cor`, `Tamanho`, `Peso`, `Lote`) VALUES
(1, 'base', NULL, NULL, 10.99, NULL, NULL, NULL, NULL, 'wepink', NULL, NULL, NULL, NULL),
(2, 'iphone 11', NULL, NULL, 2.50, NULL, NULL, NULL, NULL, 'Apple', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `relogio`
--

CREATE TABLE `relogio` (
  `Produto_ID` int(11) NOT NULL,
  `Pulseira` varchar(100) DEFAULT NULL,
  `Sistema` varchar(100) DEFAULT NULL,
  `Protecao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tenis`
--

CREATE TABLE `tenis` (
  `Produto_ID` int(11) NOT NULL,
  `Respiravel` tinyint(1) DEFAULT NULL,
  `Sistema_Amortecimento` varchar(255) DEFAULT NULL,
  `Cano` varchar(100) DEFAULT NULL,
  `Cadarco` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tv`
--

CREATE TABLE `tv` (
  `Produto_ID` int(11) NOT NULL,
  `Smart` tinyint(1) DEFAULT NULL,
  `Imagem` varchar(255) DEFAULT NULL,
  `Audio` varchar(255) DEFAULT NULL,
  `Polegadas` decimal(4,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `whey`
--

CREATE TABLE `whey` (
  `Produto_ID` int(11) NOT NULL,
  `Sabor` varchar(100) DEFAULT NULL,
  `Tipo` varchar(100) DEFAULT NULL,
  `Validade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Cliente_ID` (`Cliente_ID`),
  ADD KEY `Produto_ID` (`Produto_ID`);

--
-- Índices de tabela `celular`
--
ALTER TABLE `celular`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CPF` (`CPF`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Cliente_ID` (`Cliente_ID`),
  ADD KEY `Loja_ID` (`Loja_ID`),
  ADD KEY `Pagamento_ID` (`Pagamento_ID`);

--
-- Índices de tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Cliente_ID` (`Cliente_ID`),
  ADD KEY `Pedido_ID` (`Pedido_ID`);

--
-- Índices de tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `CNPJ` (`CNPJ`);

--
-- Índices de tabela `notebook`
--
ALTER TABLE `notebook`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `panela`
--
ALTER TABLE `panela`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Compra_ID` (`Compra_ID`),
  ADD UNIQUE KEY `Entrega_ID` (`Entrega_ID`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `relogio`
--
ALTER TABLE `relogio`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices de tabela `tenis`
--
ALTER TABLE `tenis`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices de tabela `tv`
--
ALTER TABLE `tv`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- Índices de tabela `whey`
--
ALTER TABLE `whey`
  ADD PRIMARY KEY (`Produto_ID`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `loja`
--
ALTER TABLE `loja`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`);

--
-- Restrições para tabelas `celular`
--
ALTER TABLE `celular`
  ADD CONSTRAINT `celular_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`Loja_ID`) REFERENCES `loja` (`ID`),
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`Pagamento_ID`) REFERENCES `pagamento` (`ID`);

--
-- Restrições para tabelas `historico`
--
ALTER TABLE `historico`
  ADD CONSTRAINT `historico_ibfk_1` FOREIGN KEY (`Cliente_ID`) REFERENCES `cliente` (`ID`),
  ADD CONSTRAINT `historico_ibfk_2` FOREIGN KEY (`Pedido_ID`) REFERENCES `pedido` (`ID`);

--
-- Restrições para tabelas `notebook`
--
ALTER TABLE `notebook`
  ADD CONSTRAINT `notebook_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `panela`
--
ALTER TABLE `panela`
  ADD CONSTRAINT `panela_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Compra_ID`) REFERENCES `compra` (`ID`),
  ADD CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Entrega_ID`) REFERENCES `entrega` (`ID`);

--
-- Restrições para tabelas `relogio`
--
ALTER TABLE `relogio`
  ADD CONSTRAINT `relogio_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tenis`
--
ALTER TABLE `tenis`
  ADD CONSTRAINT `tenis_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `tv`
--
ALTER TABLE `tv`
  ADD CONSTRAINT `tv_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `whey`
--
ALTER TABLE `whey`
  ADD CONSTRAINT `whey_ibfk_1` FOREIGN KEY (`Produto_ID`) REFERENCES `produto` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
