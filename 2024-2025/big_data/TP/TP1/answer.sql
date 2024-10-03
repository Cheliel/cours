
EXO 1

SELECT QUANTITE, NOM_PRODUIT, NO_FOURNISSEUR, CODE_CATEGORIE, UNITES_STOCK FROM PRODUITS p
WHERE (p.NO_FOURNISSEUR BETWEEN 1 AND 3) AND
 (p.CODE_CATEGORIE  BETWEEN 1 AND 3) AND
  p.QUANTITE LIKE '%boîtes%' OR p.QUANTITE LIKE '%cartons%';



EXO 2

  SELECT c.SOCIETE ,count(*) AS nbr_commandes, a.ANNEE FROM CLIENTS c
join commandes a on a.code_client = c.code_client
where c.pays = 'France'
and a.annee = 2011
group by societe, a.ANNEE 
order by nbr_commandes desc;


EXO 2

select 
        c.societe,
        a.annee,
        count(*) as nbr_commandes
from clients c
join commandes a on a.code_client = c.code_client
where c.pays = 'France' and a.annee = 2011
group by societe,a.annee
HAVING count(*) > 20
order by nbr_commandes desc;


