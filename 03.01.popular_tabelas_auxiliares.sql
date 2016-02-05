

/*
  Amarildo Lacerda
  Objetivo: forçar a atualizacao da tabela de apoio
*/


execute block
as
declare variable nome varchar(50);
declare variable codigo varchar(18);
begin

  for select nome,codigo from fb_prod
  into :nome,:codigo
  do
  begin

     in autonomous transaction do
        execute procedure palavra_chave_fb_prod_add(:codigo,:nome,'BD');

  end

end




