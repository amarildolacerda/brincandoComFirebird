/*
   Amarildo Lacerda
   Trigger para disparar a atualizacao do dicionario de palavras
*/


SET TERM ^ ;



CREATE OR ALTER TRIGGER FB_PROD_PALAVRACHAVE FOR FB_PROD
ACTIVE BEFORE INSERT OR UPDATE OR DELETE POSITION 0
AS
begin

  if (deleting) then
  in autonomous transaction do   /* controle de transacao */
     delete from palavra_chave_fb_prod where codigo= old.codigo;

  if ((inserting) or ( updating and new.nome<>old.nome) ) then
  begin

     in autonomous transaction do
        delete from palavra_chave_fb_prod where codigo=old.codigo and usuario='BD';

     in autonomous transaction do
        execute procedure palavra_chave_fb_prod_add(new.codigo,new.nome,'BD');

/* exemplo para indicar que outras colunas podem ser incluidas no dicionario */
--     in autonomous transaction do
--        execute procedure palavra_chave_fb_prod_add(new.codigo,new.marca,'BD');
--     execute procedure palavra_chave_ctprod_add(new.codigo,new.nomereduz,'BD');
--     execute procedure palavra_chave_ctprod_add(new.codigo,new.synopse,'BD')

  end

end
^

SET TERM ; ^
