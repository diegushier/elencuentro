DROP TABLE IF EXISTS notas CASCADE;
DROP TABLE IF EXISTS categorias CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS votos CASCADE;

CREATE TABLE usuarios
(
        id      bigserial       PRIMARY KEY
    ,   nombre  VARCHAR(255)    UNIQUE NOT NULL
    ,   passwd  VARCHAR(255)    NOT NULL
    ,   mail  VARCHAR(255)      NOT NULL
);

CREATE TABLE categorias
(
        id      bigserial       PRIMARY KEY
    ,   nombre  VARCHAR(255)    UNIQUE NOT NULL
);

CREATE TABLE notas
(
        id      bigserial       PRIMARY KEY
    ,   titulo  VARCHAR(255)    UNIQUE NOT NULL
    ,   header  text            UNIQUE NOT NULL
    ,   cuerpo  text            NOT NULL
    ,   cat_id  bigint          NOT NULL REFERENCES categorias (id)
                                ON DELETE NO ACTION ON UPDATE CASCADE
    ,   user_id bigint          NOT NULL REFERENCES usuarios (id)
                                ON DELETE NO ACTION ON UPDATE CASCADE
    ,   fecha   varchar(20)     NOT NULL  
);

CREATE TABLE IF NOT EXISTS votos
(
        id          bigserial       PRIMARY KEY
    ,   notas_id    bigint          NOT NULL REFERENCES notas (id)
                                    ON DELETE NO ACTION ON UPDATE CASCADE
    ,   user_id     bigint          NOT NULL REFERENCES usuarios (id)
                                    ON DELETE NO ACTION ON UPDATE CASCADE
);


INSERT INTO usuarios (nombre, passwd, mail)
VALUES ('diego', crypt('diego', gen_salt('bf', 12)), 'diegohilderink@gmail.com')
    ,  ('cadena', crypt('cadena', gen_salt('bf', 12)), 'cadena@gmail.com')
    ,  ('jorge', crypt('jorge', gen_salt('bf', 12)), 'jorge@gmail.com')
    ,  ('admin', crypt('admin', gen_salt('bf', 12)), 'admin@gmail.com')
;

INSERT INTO categorias (nombre)
VALUES  ('arte')
    ,   ('juegos')
    ,   ('actualidad')
    ,   ('ocio')
    ,   ('peliculas')
;

INSERT INTO notas(titulo, header, cuerpo, cat_id, user_id, fecha)
VALUES  ('Trilogía trajano', 'Este post es sobre la trilogía de trajano escrito por Santiago Posteguillo', 'Este post es sobre la trilogía de trajano escrito por Santiago Posteguillo', 4, 1,'20 January 2019')
    ,   ('Las obras de mi madre', 'Este post va sobre obras creadas por mi madre', 'Este post es sobre la trilogía de trajano escrito por Santiago Posteguillo', 1, 2, '20 February 2018')
    ,   ('Saga de Star Wars', 'La saga acaba con la novena parte de star wars', 'Este post es sobre la trilogía de trajano escrito por Santiago Posteguillo', 5, 1, '5 January 2020')
;

INSERT INTO votos (user_id, notas_id)
VALUES  (2, 1)
    ,   (2, 3)
    ,   (3, 1)
    ,   (1, 2)
    ;



