/*Criação do banco de dados fullstackeletro */
CREATE DATABASE fullstackeletro_node;
USE fullstackeletro_node;

/*Criação da tabela que contém os produtos*/
CREATE TABLE `produto` (
  `idproduto` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `descricao` varchar(150) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `preco` decimal(8,2) DEFAULT NULL,
  `precofinal` decimal(8,2) DEFAULT NULL,
  `imagem` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  UNIQUE KEY `imagem` (`imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Inserção feita na tabela produto, diretamente no banco*/
INSERT INTO `produto` VALUES 
(1,'geladeira','Geladeira/Refrigerador Consul Duplex Frost Free 340 litros Branca 110V',2069.89,1969.89,'Geladeira01_1.png'),
(2,'geladeira','Geladeira/Refrigerador Brastemp Frost Free BRM44 375 Litros - Evox - 110v',2448.99,2348.99,'Geladeira02_1.png'),
(3,'geladeira','Geladeira Brastemp Side Inverse BRO80 540 Litros Ice Maker Evox 110v',5258.99,5199.99,'Geladeira03_1.png'),
(4,'fogao','Fogão Brastemp 5 Bocas BFS5N - Inox',1599.89,1499.89,'Fogao01_1.png'),
(5,'fogao','Fogão de Piso Mesa de Vidro Electrolux 5',1848.89,1748.89,'Fogao02_1.png'),
(6,'microondas','Microondas 25L Espelhado Pme25 Philco 127V',679.99,579.99,'Microondas01_1.png'),
(7,'microondas','Micro-ondas Consul Espelhado 32 Litros - CMS45 240v',4100.00,4000.00,'Microondas02_1.png'),
(8,'microondas','Micro-ondas Brastemp Espelhado Grill 32',1173.81,1073.81,'Microondas03_1.png'),
(9,'lavadoura','Máquina De Lavar Roupas Midea Storm',3099.00,2999.00,'Lavadoura01_1.png'),
(10,'lavadoura','Lavadora de Roupas Brastemp 12Kg',2099.99,1999.99,'Lavadoura02_1.png'),
(11,'lavaLoucas','Lava-Louças Electrolux Inox 14 Serviços LV14X',4423.90,4323.90,'Lava_louca01_1.png'),
(12,'lavaLoucas','Lava Louças Brastemp 10 Serviços BLF10 Branca 110V',3699.89,3599.89,'Lava_louca02_1.png');

/*Criação da tabela que terá os comentários. A inserção dos dados será pelo front-end (ReactJS)*/
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mensagem` varchar(300) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Criação da tabela que terá os pedidos. A inserção dos dados será pelo front-end (ReactJS)*/
CREATE TABLE `pedido` (
  `num_pedido` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `nome_cliente` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `endereco` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `telefone` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `nome_produto` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `valor_unitario` decimal(8,2) NOT NULL,
  `quantidade` tinyint NOT NULL,
  `valor_total` decimal(8,2) NOT NULL,
   PRIMARY KEY (`num_pedido`),
   FOREIGN KEY (`id_produto`) references produto(`idproduto`)
)  ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Joins de rankeamento*/

/*Categoria mais consumida*/
/*
SELECT categoria, SUM(quantidade) FROM produto
INNER JOIN pedido
ON idproduto = num_pedido
GROUP BY categoria ORDER BY SUM(quantidade) DESC;
*/
/*O cliente que mais comprou em quantidade*/
/*
SELECT nome_cliente, descricao, MAX(quantidade) FROM produto
INNER JOIN pedido
ON idproduto = num_pedido;
*/