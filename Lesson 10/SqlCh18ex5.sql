USE MyGuitarShop;

ALTER ROLE OrderEntry DROP MEMBER AdminUser;
ALTER ROLE OrderEntry DROP MEMBER JoelMurach;
ALTER ROLE OrderEntry DROP MEMBER MikeMurach;
ALTER ROLE OrderEntry DROP MEMBER RBrautigan;
ALTER ROLE OrderEntry DROP MEMBER RobertHalliday;
DROP ROLE OrderEntry;