/*
   Amarildo Lacerda
   
*/


/* exemplo que não usa indice */
select codigo,nome from fb_prod
where nome like '%lindinha%'
      AND
      nome like '%2016%';
      
      
      
/* exemplo que usa indice */
select codigo, nome from fb_prod
where nome like 'Boneca%'
         
         
/* exemplo otimizado */        
select codigo,nome 
from fb_prod a, palavra_chave_fb_prod b
WHERE 
    a.codigo=b.CODIGO
    and 
    b.palavra like 'lindinha%'
    AND
    b.palavra like '2016%'         
         