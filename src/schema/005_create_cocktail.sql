CREATE TABLE COCKTAIL
(
  ID_COCKTAIL NUMBER       NOT NULL,
  NAME        VARCHAR2(20) NOT NULL,
  PRICE       INT          NOT NULL,

  CONSTRAINT COCKTAIL_PK PRIMARY KEY (ID_COCKTAIL)
);
