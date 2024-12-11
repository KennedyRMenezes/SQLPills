CREATE DATABASE RedeSocial;

USE RedeSocial;

-- Tabela de usuários
CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100),
    data_registro DATE
);

-- Tabela de posts
CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    usuario_id INT,
    conteudo TEXT,
    data_postagem DATETIME,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Tabela de comentários
CREATE TABLE comentarios (
    comentario_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    usuario_id INT,
    conteudo TEXT,
    data_comentario DATETIME,
    FOREIGN KEY (post_id) REFERENCES posts(post_id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id)
);

-- Tabela de seguidores
CREATE TABLE seguidores (
    usuario_id INT,
    seguindo_id INT,
    PRIMARY KEY (usuario_id, seguindo_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (seguindo_id) REFERENCES usuarios(usuario_id)
);

-- Inserção de dados na tabela usuarios
INSERT INTO usuarios (usuario_id, nome, cidade, data_registro) VALUES
(1, 'Ana Silva', 'São Paulo', '2023-06-15'),
(2, 'Carlos Souza', 'Rio de Janeiro', '2022-08-10'),
(3, 'Lucas Oliveira', 'São Paulo', '2021-04-12'),
(4, 'Maria Fernandes', 'Belo Horizonte', '2022-11-23'),
(5, 'João Santos', 'São Paulo', '2021-01-20'),
(6, 'Fernanda Costa', 'Curitiba', '2023-01-17'),
(7, 'Paula Almeida', 'Rio de Janeiro', '2023-09-05');

-- Inserção de dados na tabela posts
INSERT INTO posts (post_id, usuario_id, conteudo, data_postagem) VALUES
(2, 2, 'Como otimizar seu tempo no trabalho.', '2024-10-12 14:45:00'),
(3, 3, 'Reflexão sobre o futuro das cidades inteligentes.', '2024-10-08 18:20:00'),
(4, 4, 'Os desafios de morar em uma cidade grande.', '2024-10-05 08:00:00'),
(5, 5, 'O impacto da tecnologia no ensino de crianças.', '2024-09-15 20:00:00'),
(6, 6, 'Como a arte pode transformar o mundo.', '2024-10-01 12:30:00'),
(7, 7, 'Tendências em moda para o verão de 2024.', '2024-10-09 16:50:00');

-- Inserção de dados na tabela comentarios
INSERT INTO comentarios (comentario_id, post_id, usuario_id, conteudo, data_comentario) VALUES
(1, 1, 2, 'Adorei o seu post, Ana! Totalmente de acordo.', '2024-10-11 11:00:00'),
(2, 1, 3, 'Muito bom, precisamos de mais postagens assim.', '2024-10-11 12:30:00'),
(3, 2, 1, 'Excelente reflexão sobre o trabalho, Carlos!', '2024-10-13 15:00:00'),
(4, 4, 5, 'Eu também enfrento esses desafios, Maria.', '2024-10-06 09:30:00'),
(5, 5, 6, 'Tecnologia é, sem dúvida, uma aliada no ensino.', '2024-09-16 10:00:00'),
(6, 7, 2, 'Post muito interessante, Paula. Adorei as dicas!', '2024-10-10 17:30:00');

-- Inserção de dados na tabela seguidores
INSERT INTO seguidores (usuario_id, seguindo_id) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 5),
(5, 1),
(6, 7),
(7, 2),
(1, 4),
(5, 6),
(6, 2);
