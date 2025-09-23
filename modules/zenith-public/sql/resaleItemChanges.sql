-----------------------------------
-- Item Resale Price Adjustment
-- Updates every base sell price of items in the game to be 95% of its original value,
-- with a minimum value of 1 to prevent extremely low prices
-- Public module for ZenithXI
-----------------------------------

UPDATE item_basic
SET BaseSell = GREATEST(BaseSell * 0.95, 1); -- Reduce all item base sell prices by 5%