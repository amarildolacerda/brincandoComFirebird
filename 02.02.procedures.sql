/*
   Amarildo Lacerda
   Procedure que faz a separacao da palavra para criar um dicionario de palavras chaves
*/

SET TERM ^ ;

CREATE OR ALTER PROCEDURE SPLIT_STRING (
    p_string varchar(32000),
    p_splitter char(1))
returns (
    part varchar(32000))
as
declare variable lastpos integer;
declare variable nextpos integer;
begin
    p_string = :p_string || :p_splitter;
    lastpos = 1;
    nextpos = position(:p_splitter, :p_string, lastpos);
    if (lastpos = nextpos) then
        begin
            part = substring(:p_string from :lastpos for :nextpos - :lastpos);
            suspend;
            lastpos = :nextpos + 1;
            nextpos = position(:p_splitter, :p_string, lastpos);
        end
    while (:nextpos > 1) do
        begin
            part = substring(:p_string from :lastpos for :nextpos - :lastpos);
            lastpos = :nextpos + 1;
            nextpos = position(:p_splitter, :p_string, lastpos);
            suspend;
        end
end^

SET TERM ; ^

/* Existing privileges on this procedure */
GRANT EXECUTE ON PROCEDURE SPLIT_STRING TO SYSDBA;
