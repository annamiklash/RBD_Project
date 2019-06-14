CREATE TABLE LIQUOR_FOR_MENU
(
  ID_LIQUOR_FOR_MENU NUMBER NOT NULL,
  ID_LIQUOR          NUMBER NOT NULL,
  ID_BEVERAGE_MENU   NUMBER NOT NULL,

  CONSTRAINT LIQUOR_FOR_MENU_PK PRIMARY KEY (ID_LIQUOR_FOR_MENU),
  CONSTRAINT LIQUOR_FOR_MENU_LIQ_FK FOREIGN KEY (ID_LIQUOR)
  REFERENCES LIQUOR (ID_LIQUOR),
  CONSTRAINT LIQUOR_FOR_MENU_BEV_MENU_FK FOREIGN KEY (ID_BEVERAGE_MENU)
  REFERENCES BEVERAGE_MENU (ID_BEVERAGE_MENU)

);