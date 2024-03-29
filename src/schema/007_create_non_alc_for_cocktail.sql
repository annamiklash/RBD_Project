CREATE TABLE NON_ALC_FOR_COCKTAIL
(
  ID_NON_ALC_FOR_COCKTAIL NUMBER NOT NULL,
  ID_COCKTAIL             NUMBER NOT NULL,
  ID_NON_ALC_DRINK        NUMBER NOT NULL,

  CONSTRAINT NON_ALC_FOR_COCKTAIL_PK PRIMARY KEY (ID_NON_ALC_FOR_COCKTAIL),
  CONSTRAINT NON_ALC_FOR_COCKTAIL_COCK_FK FOREIGN KEY (ID_COCKTAIL)
  REFERENCES COCKTAIL (ID_COCKTAIL),
  CONSTRAINT NON_ALC_FOR_COCKTAIL_NONALC_FK FOREIGN KEY (ID_NON_ALC_DRINK)
  REFERENCES NON_ALC_DRINK(ID_NON_ALC_DRINK)
);
