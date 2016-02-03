
execute block
as
declare variable codigo varchar(18);
declare variable nome varchar(50);
declare variable unidade varchar(5);
declare variable preco double precision;
begin
  for select first 100000 codigo,nome,unidade,preco from fb_prod
  into :codigo,:nome, :unidade, :preco
  do
  begin
    in autonomous transaction do
    begin
     insert into fb_prod
       (codigo,nome,unidade,preco)
       values
       (:codigo||'A',
        'A'||:nome||'A',
        :unidade,
        :preco);
    end
  end

end
