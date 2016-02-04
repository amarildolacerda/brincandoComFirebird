/*
   Amarildo Lacerda
   Procedure para montar o dicionario de palavras chaves
*/   

SET TERM ^ ;

CREATE OR ALTER PROCEDURE PALAVRA_CHAVE_FB_PROD_ADD (
    codigo varchar(18),
    texto varchar(1024),
    usuario varchar(10))
as
declare variable t varchar(1024);
declare variable w char(30);
begin
   t = upper(texto);
   for select trim(substring(part from 1 for 30)) from split_string(:t,' ') into :w
   do
   begin
       if (strlen(trim(w))>1) then
       begin
        if (not exists (select 1 from palavra_chave_ignore where texto=:w )) then
        in autonomous transaction do
         update or insert into palavra_chave_fb_prod
                (codigo,  palavra, usuario,dtatualiz)
                values(:codigo,:w,:usuario,cast('now' as date))
         matching (codigo,palavra);
       end
   end
end^

SET TERM ; ^

/* Existing privileges on this procedure */
GRANT EXECUTE ON PROCEDURE PALAVRA_CHAVE_FB_PROD_ADD TO SYSDBA;
