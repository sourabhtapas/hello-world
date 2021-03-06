----------------------------------------------------------------------------------
-- Create Date                       : 04/08/2016 12:23:28 PM
-- Module Name                       : Mydatatype_pkg
-- Description                       : package to declare new data type and to store P2 and P4 code coefficients
-- company                           : Airbus Group India Pvt.Ltd
-- Engineer                          : Vishal Goyal, Sourabh Tapas
-- Development Platform              : Vivado 2016.1
-- Testing and Verification Platform : Vivado 2016.1
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;

package mydatatype_pkg is

    type aslv98X18 is array(0 to 97) of std_logic_vector (17 downto 0);
    type aslv98X17 is array(0 to 97) of std_logic_vector (16 downto 0);
    
constant P2_coefCplusD : aslv98X17 := (0 => '0' & X"8D86",
1 => '1' & X"5CE9",
2 => '0' & X"B077",
3 => '1' & X"4AFD",
4 => '0' & X"B077",
5 => '1' & X"5CE9",
6 => '0' & X"8D86",
7 => '1' & X"8F24",
8 => '0' & X"4E8A",
9 => '1' & X"D7B8",
10 => '0' & X"0000",
11 => '0' & X"2848",
12 => '1' & X"B176",
13 => '0' & X"70DC",
14 => '1' & X"5CE9",
15 => '0' & X"B077",
16 => '1' & X"8F24",
17 => '0' & X"0000",
18 => '0' & X"70DC",
19 => '1' & X"4F89",
20 => '0' & X"A317",
21 => '1' & X"B176",
22 => '1' & X"D7B8",
23 => '0' & X"8D86",
24 => '1' & X"4AFD",
25 => '0' & X"8D86",
26 => '1' & X"D7B8",
27 => '1' & X"B176",
28 => '0' & X"B077",
29 => '1' & X"8F24",
30 => '1' & X"B176",
31 => '0' & X"B503",
32 => '1' & X"B176",
33 => '1' & X"8F24",
34 => '0' & X"B077",
35 => '1' & X"D7B8",
36 => '1' & X"727A",
37 => '0' & X"A317",
38 => '0' & X"0000",
39 => '1' & X"5CE9",
40 => '0' & X"8D86",
41 => '0' & X"2848",
42 => '1' & X"4AFD",
43 => '0' & X"0000",
44 => '0' & X"B503",
45 => '0' & X"0000",
46 => '1' & X"4AFD",
47 => '0' & X"0000",
48 => '0' & X"B503",
49 => '0' & X"0000",
50 => '1' & X"4AFD",
51 => '0' & X"0000",
52 => '0' & X"B503",
53 => '0' & X"0000",
54 => '1' & X"4AFD",
55 => '0' & X"0000",
56 => '0' & X"B077",
57 => '0' & X"70DC",
58 => '1' & X"B176",
59 => '1' & X"4AFD",
60 => '1' & X"B176",
61 => '0' & X"70DC",
62 => '0' & X"B077",
63 => '0' & X"2848",
64 => '1' & X"727A",
65 => '1' & X"5CE9",
66 => '0' & X"0000",
67 => '0' & X"A317",
68 => '0' & X"8D86",
69 => '1' & X"D7B8",
70 => '1' & X"5CE9",
71 => '1' & X"4F89",
72 => '1' & X"8F24",
73 => '0' & X"0000",
74 => '0' & X"70DC",
75 => '0' & X"B077",
76 => '0' & X"A317",
77 => '0' & X"4E8A",
78 => '1' & X"D7B8",
79 => '1' & X"727A",
80 => '1' & X"4AFD",
81 => '1' & X"727A",
82 => '1' & X"D7B8",
83 => '0' & X"4E8A",
84 => '0' & X"8D86",
85 => '0' & X"A317",
86 => '0' & X"B077",
87 => '0' & X"B503",
88 => '0' & X"B077",
89 => '0' & X"A317",
90 => '0' & X"8D86",
91 => '0' & X"70DC",
92 => '0' & X"4E8A",
93 => '0' & X"2848",
94 => '0' & X"0000",
95 => '1' & X"D7B8",
96 => '1' & X"B176",
97 => --'1' & X"C792"); --
'1' & X"8F24");

constant P2_coefD : aslv98X17 := (0 => '0' & X"0E55",
1 => '1' & X"D5BA",
2 => '0' & X"4418",
3 => '1' & X"A57F",
4 => '0' & X"6C60",
5 => '1' & X"872F",
6 => '0' & X"7F31",
7 => '1' & X"80CF",
8 => '0' & X"78D1",
9 => '1' & X"93A0",
10 => '0' & X"5A81",
11 => '1' & X"BBE8",
12 => '0' & X"2A46",
13 => '1' & X"F1AB",
14 => '1' & X"D5BA",
15 => '0' & X"6C60",
16 => '1' & X"80CF",
17 => '0' & X"5A81",
18 => '1' & X"F1AB",
19 => '1' & X"BBE8",
20 => '0' & X"78D1",
21 => '1' & X"872F",
22 => '0' & X"4418",
23 => '0' & X"0E55",
24 => '1' & X"A57F",
25 => '0' & X"7F31",
26 => '1' & X"93A0",
27 => '0' & X"2A46",
28 => '0' & X"4418",
29 => '1' & X"80CF",
30 => '0' & X"2A46",
31 => '0' & X"5A81",
32 => '1' & X"872F",
33 => '0' & X"0E55",
34 => '0' & X"6C60",
35 => '1' & X"93A0",
36 => '1' & X"F1AB",
37 => '0' & X"78D1",
38 => '1' & X"A57F",
39 => '1' & X"D5BA",
40 => '0' & X"7F31",
41 => '1' & X"BBE8",
42 => '1' & X"A57F",
43 => '0' & X"5A81",
44 => '0' & X"5A81",
45 => '1' & X"A57F",
46 => '1' & X"A57F",
47 => '0' & X"5A81",
48 => '0' & X"5A81",
49 => '1' & X"A57F",
50 => '1' & X"A57F",
51 => '0' & X"5A81",
52 => '0' & X"5A81",
53 => '1' & X"A57F",
54 => '1' & X"A57F",
55 => '0' & X"5A81",
56 => '0' & X"6C60",
57 => '1' & X"F1AB",
58 => '1' & X"872F",
59 => '1' & X"A57F",
60 => '0' & X"2A46",
61 => '0' & X"7F31",
62 => '0' & X"4418",
63 => '1' & X"BBE8",
64 => '1' & X"80CF",
65 => '1' & X"D5BA",
66 => '0' & X"5A81",
67 => '0' & X"78D1",
68 => '0' & X"0E55",
69 => '1' & X"93A0",
70 => '1' & X"872F",
71 => '1' & X"BBE8",
72 => '0' & X"0E55",
73 => '0' & X"5A81",
74 => '0' & X"7F31",
75 => '0' & X"6C60",
76 => '0' & X"2A46",
77 => '1' & X"D5BA",
78 => '1' & X"93A0",
79 => '1' & X"80CF",
80 => '1' & X"A57F",
81 => '1' & X"F1AB",
82 => '0' & X"4418",
83 => '0' & X"78D1",
84 => '0' & X"7F31",
85 => '0' & X"78D1",
86 => '0' & X"6C60",
87 => '0' & X"5A81",
88 => '0' & X"4418",
89 => '0' & X"2A46",
90 => '0' & X"0E55",
91 => '1' & X"F1AB",
92 => '1' & X"D5BA",
93 => '1' & X"BBE8",
94 => '1' & X"A57F",
95 => '1' & X"93A0",
96 => '1' & X"872F",
97 => --'1' & X"C068");--
'1' & X"80CF");


constant P2_coefC : aslv98X17 := (0 => '0' & X"7F31",
1 => '1' & X"872F",
2 => '0' & X"6C60",
3 => '1' & X"A57F",
4 => '0' & X"4418",
5 => '1' & X"D5BA",
6 => '0' & X"0E55",
7 => '0' & X"0E55",
8 => '1' & X"D5BA",
9 => '0' & X"4418",
10 => '1' & X"A57F",
11 => '0' & X"6C60",
12 => '1' & X"872F",
13 => '0' & X"7F31",
14 => '1' & X"872F",
15 => '0' & X"4418",
16 => '0' & X"0E55",
17 => '1' & X"A57F",
18 => '0' & X"7F31",
19 => '1' & X"93A0",
20 => '0' & X"2A46",
21 => '0' & X"2A46",
22 => '1' & X"93A0",
23 => '0' & X"7F31",
24 => '1' & X"A57F",
25 => '0' & X"0E55",
26 => '0' & X"4418",
27 => '1' & X"872F",
28 => '0' & X"6C60",
29 => '0' & X"0E55",
30 => '1' & X"872F",
31 => '0' & X"5A81",
32 => '0' & X"2A46",
33 => '1' & X"80CF",
34 => '0' & X"4418",
35 => '0' & X"4418",
36 => '1' & X"80CF",
37 => '0' & X"2A46",
38 => '0' & X"5A81",
39 => '1' & X"872F",
40 => '0' & X"0E55",
41 => '0' & X"6C60",
42 => '1' & X"A57F",
43 => '1' & X"A57F",
44 => '0' & X"5A81",
45 => '0' & X"5A81",
46 => '1' & X"A57F",
47 => '1' & X"A57F",
48 => '0' & X"5A81",
49 => '0' & X"5A81",
50 => '1' & X"A57F",
51 => '1' & X"A57F",
52 => '0' & X"5A81",
53 => '0' & X"5A81",
54 => '1' & X"A57F",
55 => '1' & X"A57F",
56 => '0' & X"4418",
57 => '0' & X"7F31",
58 => '0' & X"2A46",
59 => '1' & X"A57F",
60 => '1' & X"872F",
61 => '1' & X"F1AB",
62 => '0' & X"6C60",
63 => '0' & X"6C60",
64 => '1' & X"F1AB",
65 => '1' & X"872F",
66 => '1' & X"A57F",
67 => '0' & X"2A46",
68 => '0' & X"7F31",
69 => '0' & X"4418",
70 => '1' & X"D5BA",
71 => '1' & X"93A0",
72 => '1' & X"80CF",
73 => '1' & X"A57F",
74 => '1' & X"F1AB",
75 => '0' & X"4418",
76 => '0' & X"78D1",
77 => '0' & X"78D1",
78 => '0' & X"4418",
79 => '1' & X"F1AB",
80 => '1' & X"A57F",
81 => '1' & X"80CF",
82 => '1' & X"93A0",
83 => '1' & X"D5BA",
84 => '0' & X"0E55",
85 => '0' & X"2A46",
86 => '0' & X"4418",
87 => '0' & X"5A81",
88 => '0' & X"6C60",
89 => '0' & X"78D1",
90 => '0' & X"7F31",
91 => '0' & X"7F31",
92 => '0' & X"78D1",
93 => '0' & X"6C60",
94 => '0' & X"5A81",
95 => '0' & X"4418",
96 => '0' & X"2A46",
97 => --'0' & X"072A");--
'0' & X"0E55");
end package mydatatype_pkg;

