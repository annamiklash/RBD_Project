/*
 insert
 */

CREATE OR REPLACE TRIGGER check_exp_date
    BEFORE INSERT
    ON LIQUOR
    FOR EACH ROW
BEGIN
    IF (:new.DATE_OF_EXP < CURRENT_DATE)
    THEN
        raise_application_error(-20000, 'The Product Is Expired');
    END IF;
END ;


CREATE OR REPLACE TRIGGER counting_ingredients
    AFTER INSERT
    ON LIQUOR_FOR_COCKTAIL
    FOR EACH ROW
DECLARE
    counter SMALLINT;
BEGIN
    SELECT INGREDIENT_COUNT INTO counter
    FROM COCKTAIL
    WHERE COCKTAIL.ID_COCKTAIL = :NEW.ID_COCKTAIL;

    counter := counter + 1;

    UPDATE COCKTAIL
    SET INGREDIENT_COUNT=counter
    WHERE COCKTAIL.ID_COCKTAIL = :NEW.ID_COCKTAIL;
END;

 /*
  table trigger
  */
CREATE OR REPLACE TRIGGER CocktailOnMenuCounter
    AFTER INSERT OR DELETE
    ON COCKTAIL_FOR_MENU
DECLARE
    cocktailCount INTEGER;
BEGIN
    SELECT count(*) INTO cocktailCount
    FROM COCKTAIL_FOR_MENU;

    DBMS_OUTPUT.PUT_LINE('Total amount of cocktails on the current menu is ' || cocktailCount);
END;

SELECT *
FROM COCKTAIL_FOR_MENU;

/*
 delete
 */
CREATE OR REPLACE TRIGGER NotLessThanOneLiquorInCocktail
    BEFORE DELETE
    ON LIQUOR_FOR_COCKTAIL
    FOR EACH ROW
DECLARE
    liquorCounter NUMBER;
BEGIN
    SELECT INGREDIENT_COUNT INTO liquorCounter FROM COCKTAIL WHERE COCKTAIL.ID_COCKTAIL = :OLD.ID_COCKTAIL;
    IF liquorCounter = 1
    THEN
        raise_application_error(-20001, 'Cocktail must have at least one liquor');
    END IF;
END;


CREATE OR REPLACE TRIGGER decrementing_ingredients
    AFTER DELETE
    ON LIQUOR_FOR_COCKTAIL
    FOR EACH ROW
DECLARE
    counter SMALLINT;
BEGIN
    SELECT INGREDIENT_COUNT INTO counter
    FROM COCKTAIL
    WHERE COCKTAIL.ID_COCKTAIL = :OLD.ID_COCKTAIL;

    counter := counter - 1;

    UPDATE COCKTAIL
    SET INGREDIENT_COUNT=counter
    WHERE COCKTAIL.ID_COCKTAIL = :OLD.ID_COCKTAIL;
END;

/*
 update
 */

CREATE OR REPLACE TRIGGER mod_date
    BEFORE UPDATE
    ON LIQUOR
    FOR EACH ROW
BEGIN

    :NEW.modification_date := CURRENT_TIMESTAMP;

    DBMS_OUTPUT.PUT_LINE('UPDATE : ' || :NEW.MODIFICATION_DATE);
END;


CREATE OR REPLACE TRIGGER countLiqOnMenu
    AFTER UPDATE OF id_liquor
    ON LIQUOR_FOR_MENU
    FOR EACH ROW
DECLARE
    liquorNameNew VARCHAR2(200);
    liquorNameOld VARCHAR2(200);

BEGIN

    SELECT name INTO liquorNameNew
    FROM liquor l
    WHERE l.ID_LIQUOR = :new.ID_LIQUOR;
    SELECT name INTO liquorNameOld
    FROM liquor l
    WHERE l.ID_LIQUOR = :old.ID_LIQUOR;

    DBMS_OUTPUT.PUT_LINE(liquorNameNew || ' has been added instead of ' || liquorNameOld);

END;

