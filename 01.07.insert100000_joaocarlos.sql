/*
  Amarildo Lacerda
  Objetivo:  adicionar 100.000 registro a base ja existente


  Observar:    
    -  como é possivel executar um trecho de codigo, que pode ir dentro uma   Query   (QUERY.SQL.TEXT), sem necessariamente
       criar uma procedure;
    - como o firebird monta um "CURSOR" automático e substitui as variáveis para serem utilizadas no LOOP;
    - observar o controle de transação feita dentro do loop

*/



execute block
as
/* variaveis */
declare variable codigo varchar(18);   
declare variable nome varchar(50);
declare variable unidade varchar(5);
declare variable preco double precision;
begin
  /* um cursor sem precisar declarar, para uso interno */
  for select first 100000 codigo,nome,unidade,preco from FB_PROD
  into :codigo,:nome, :unidade, :preco
  do
  begin
    in autonomous transaction do   /* controle de transacao */
    begin
     insert into FB_PROD
       (codigo,nome,unidade,preco)
       values
       (:codigo,
        replace(replace(:nome,'A','U'),'C','X'),
        :unidade,
        :preco);
    end
  end

end
