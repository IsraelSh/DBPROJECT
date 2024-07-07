--Procedure 1
--This procedure updates the price of food items by a given percentage.

CREATE OR REPLACE PROCEDURE update_food_prices(percentage IN NUMBER) IS
BEGIN
  UPDATE FOOD
  SET price = price * (1 + percentage / 100);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    RAISE;
END update_food_prices;
/
