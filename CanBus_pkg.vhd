library ieee;
use ieee.std_logic_1164.all;
    
package CanBus is
    ------------------------------------------------------------
    --! TYPES
    ------------------------------------------------------------
    type DataBytes is array (7 downto 0) of std_logic_vector(7 downto 0);
    type HEXTab is array (0 to 5) of std_logic_vector(0 to 7);
    
    type frame is record
        id      : std_logic_vector(28 downto 0);
        rtr     : std_logic;
        ide     : std_logic;
        dlc     : std_logic_vector(3 downto 0);
        data    : DataBytes;
    end record frame;
    
end package CanBus;