---
sticker: emoji//1faa8
---

> [!POJO]
> Plain old Java Object, sont des classes java nécessaire dans le processus d'interaction avec la BDD. Il se compose d'attribue privé, de Getter/Setter, implémente sérializable. 


> [!Entitie Manager Factory]
> Il faut mettre des annotations pour référence la classe. Avec entity manager factory on accède à la BDD.

## Relation ship 

Les relations entre les différentes tables de la BDD se formule par des annotations au niveau des propriété des Objects. 


#oneToOne
``` java 
public class{
	@oneToOne
	@JoinColumn(name="addr_fk")
	private String addr;

}
```


#oneToMany
``` java 
public class store {
	@oneToMany
	@JoinColumn(mappeBy="petStore")
	private Collection<Animal> animals;
}

public class Animal {

}
```



#manyToMany
``` java 
public class Store{
	@ManyToMany
	@JoinTable(name="STORE_PRODUCT")
	private Collection<Product> products;

}

public class Product{
	@ManyToMany
	@JoinColumn(name="addr_fk") // undone 
	private String addr;

}
```

## Cascading

	> Supprétion de donnée dans la BDD en cascade
	> Si l'addr n'existe pas elle est enrg. 



``` java 
public class{
	@oneToOne(cascade=CascadeType.PERSIT)
	@JoinColumn(name="addr_fk")
	private String addr;
}
```


## Lazy Loading 

	> Par défaut on est toujours en lazy 
	> Appliqué pour les objets de type List, Set, Map
	

``` java 
public class{
	@oneToOne(cascade=CascadeType.PERSIT, fetch=FetchType.EAGER)
	@JoinColumn(name="addr_fk")
	private String addr;
}
```




## JPQL : Java Persistant Query Language



## DAO & Factory pattern : Data Acesse Object






