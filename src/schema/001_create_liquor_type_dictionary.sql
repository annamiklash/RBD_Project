CREATE TABLE LIQUOR_TYPE_DICTIONARY
(
  ID_LIQUOR_TYPE_DICTIONARY NUMBER       NOT NULL,
  NAME                      VARCHAR2(20) NOT NULL,
  ALC                       INT       NOT NULL,

  CONSTRAINT LIQUOR_TYPE_DICTIONARY_PK PRIMARY KEY ("ID_LIQUOR_TYPE_DICTIONARY")
);