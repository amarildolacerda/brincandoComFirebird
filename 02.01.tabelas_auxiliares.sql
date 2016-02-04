/*
   Amarildo Lacerda
   Tabela para registrar uma lista de palavras associadas ao cadastro de produto
*/
CREATE TABLE PALAVRA_CHAVE_FB_PROD (
    CODIGO     VARCHAR(18) not null,
    PALAVRA    CHAR(30) not null,
    USUARIO    VARCHAR(10) not null,
    DTATUALIZ  DATE
);

/* chave primaria */
ALTER TABLE PALAVRA_CHAVE_FB_PROD ADD PRIMARY KEY (CODIGO, PALAVRA);

/* indice de palavras chaves */
CREATE INDEX PALAVRA_CHAVE_FB_PROD_PALAVRA ON PALAVRA_CHAVE_FB_PROD (PALAVRA);



/* tabela com lista de palavra a serem ignoradas */

CREATE TABLE PALAVRA_CHAVE_IGNORE (
    TEXTO  CHAR(30) not null
);

/* chave primaria */
ALTER TABLE PALAVRA_CHAVE_IGNORE ADD PRIMARY KEY (TEXTO);




/* inicializa as palavras a serem ignoradas */
delete from PALAVRA_CHAVE_IGNORE;

INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES ('DE');
INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES ('PARA');
INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES ('DO');
INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES ('ATE');
INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES ('POR');
INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES ('PELO');
INSERT INTO PALAVRA_CHAVE_IGNORE (TEXTO)
                          VALUES (' ');

COMMIT WORK;


