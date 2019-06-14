CREATE TABLE COCKTAIL_FOR_MENU
(
  ID_COCKTAIL_FOR_MENU NUMBER NOT NULL,
  ID_COCKTAIL          NUMBER NOT NULL,
  ID_BEVERAGE_MENU     NUMBER NOT NULL,

  CONSTRAINT COCKTAIL_FOR_MENU_PK PRIMARY KEY (ID_COCKTAIL_FOR_MENU),
  CONSTRAINT COCKTAIL_FOR_MENU_COCKTAIL_FK FOREIGN KEY (ID_COCKTAIL)
  REFERENCES COCKTAIL (ID_COCKTAIL),
  CONSTRAINT COCKTAIL_FOR_MENU_BEV_MENU_FK FOREIGN KEY (ID_BEVERAGE_MENU)
  REFERENCES BEVERAGE_MENU (ID_BEVERAGE_MENU)
);