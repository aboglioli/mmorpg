#!/bin/bash
echo "Creación BD"
mysql -u root -p$1 < creacionBD.sql
echo "Creación Tablas"
mysql -u root -p$1 mmorpg < creacionTablas.sql
echo "Inserciones"
echo "- Item"
mysql -u root -p$1 mmorpg < insercion_Item.sql
echo "- NPC"
mysql -u root -p$1 mmorpg < insercion_NPC.sql
echo "- Jugador"
mysql -u root -p$1 mmorpg < insercion_Jugador.sql
