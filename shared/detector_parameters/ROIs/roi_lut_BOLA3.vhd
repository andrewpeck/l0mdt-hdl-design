--------------------------------------------------------------------------------
--  UMass , Physics Department               
--  Yuan-Tang Chou                           
--  yuan-tang.chou@cern.ch                         
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger             
--  Module: rpc_z to 1st layer tube number 
--  Description: Autogenerated file          
--                                           
--------------------------------------------------------------------------------
--  Revisions: 
--      
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library heg_roi_lib;
use heg_roi_lib.roi_types_pkg.all;

package roi_lut_BOLA3 is

    -- add length of constant array
    constant ROM_BOLA3_Z_MAX_SIZE : integer := 12249;

    constant ROI_BOLA3_Z_MEM : roi_z_lut_t(0 to ROM_BOLA3_Z_MAX_SIZE - 1) := (

        0 to   149 => (  0,  0),
      150 to   164 => (  0,  0),
      165 to   179 => (  0,  0),
      180 to   194 => (  1,  0),
      195 to   209 => (  1,  1),
      210 to   224 => (  2,  1),
      225 to   239 => (  2,  2),
      240 to   254 => (  3,  2),
      255 to   269 => (  3,  3),
      270 to   284 => (  4,  3),
      285 to   299 => (  4,  4),
      300 to   314 => (  5,  4),
      315 to   329 => (  5,  5),
      330 to   344 => (  6,  5),
      345 to   359 => (  6,  6),
      360 to   374 => (  7,  6),
      375 to   389 => (  7,  7),
      390 to   404 => (  8,  7),
      405 to   419 => (  8,  8),
      420 to   434 => (  9,  8),
      435 to   449 => (  9,  9),
      450 to   464 => ( 10,  9),
      465 to   479 => ( 10, 10),
      480 to   494 => ( 11, 10),
      495 to   509 => ( 11, 11),
      510 to   524 => ( 12, 11),
      525 to   539 => ( 12, 12),
      540 to   554 => ( 13, 12),
      555 to   569 => ( 13, 13),
      570 to   584 => ( 14, 13),
      585 to   599 => ( 14, 14),
      600 to   614 => ( 15, 14),
      615 to   629 => ( 15, 15),
      630 to   644 => ( 16, 15),
      645 to   658 => ( 16, 16),
      659 to   673 => ( 17, 16),
      674 to   688 => ( 17, 17),
      689 to   703 => ( 18, 17),
      704 to   718 => ( 18, 18),
      719 to   733 => ( 19, 18),
      734 to   748 => ( 19, 19),
      749 to   763 => ( 20, 19),
      764 to   778 => ( 20, 20),
      779 to   793 => ( 21, 20),
      794 to   808 => ( 21, 21),
      809 to   823 => ( 22, 21),
      824 to   838 => ( 22, 22),
      839 to   853 => ( 23, 22),
      854 to   868 => ( 23, 23),
      869 to   883 => ( 24, 23),
      884 to   898 => ( 24, 24),
      899 to   913 => ( 25, 24),
      914 to   928 => ( 25, 25),
      929 to   943 => ( 26, 25),
      944 to   958 => ( 26, 26),
      959 to   973 => ( 27, 26),
      974 to   988 => ( 27, 27),
      989 to  1003 => ( 28, 27),
     1004 to  1018 => ( 28, 28),
     1019 to  1033 => ( 29, 28),
     1034 to  1048 => ( 29, 29),
     1049 to  1063 => ( 30, 29),
     1064 to  1078 => ( 30, 30),
     1079 to  1093 => ( 31, 30),
     1094 to  1108 => ( 31, 31),
     1109 to  1123 => ( 32, 31),
     1124 to  1138 => ( 32, 32),
     1139 to  1153 => ( 33, 32),
     1154 to  1168 => ( 33, 33),
     1169 to  1183 => ( 34, 33),
     1184 to  1198 => ( 34, 34),
     1199 to  1213 => ( 35, 34),
     1214 to  1228 => ( 35, 35),
     1229 to  1243 => ( 36, 35),
     1244 to  1258 => ( 36, 36),
     1259 to  1273 => ( 37, 36),
     1274 to  1288 => ( 37, 37),
     1289 to  1303 => ( 38, 37),
     1304 to  1318 => ( 38, 38),
     1319 to  1333 => ( 39, 38),
     1334 to  1348 => ( 39, 39),
     1349 to  1363 => ( 40, 39),
     1364 to  1378 => ( 40, 40),
     1379 to  1393 => ( 41, 40),
     1394 to  1408 => ( 41, 41),
     1409 to  1423 => ( 42, 41),
     1424 to  1438 => ( 42, 42),
     1439 to  1453 => ( 43, 42),
     1454 to  1468 => ( 43, 43),
     1469 to  1483 => ( 44, 43),
     1484 to  1498 => ( 44, 44),
     1499 to  1513 => ( 45, 44),
     1514 to  1528 => ( 45, 45),
     1529 to  1543 => ( 46, 45),
     1544 to  1558 => ( 46, 46),
     1559 to  1573 => ( 47, 46),
     1574 to  1588 => ( 47, 47),
     1589 to  1603 => ( 48, 47),
     1604 to  1618 => ( 48, 48),
     1619 to  1633 => ( 49, 48),
     1634 to  1648 => ( 49, 49),
     1649 to  1662 => ( 50, 49),
     1663 to  1677 => ( 50, 50),
     1678 to  1692 => ( 51, 50),
     1693 to  1707 => ( 51, 51),
     1708 to  1722 => ( 52, 51),
     1723 to  1737 => ( 52, 52),
     1738 to  1752 => ( 53, 52),
     1753 to  1767 => ( 53, 53),
     1768 to  1782 => ( 54, 53),
     1783 to  1797 => ( 54, 54),
     1798 to  1812 => ( 55, 54),
     1813 to  1827 => ( 55, 55),
     1828 to  1842 => ( 56, 55),
     1843 to  1857 => ( 56, 56),
     1858 to  1872 => ( 57, 56),
     1873 to  1887 => ( 57, 57),
     1888 to  1902 => ( 58, 57),
     1903 to  1917 => ( 58, 58),
     1918 to  1932 => ( 59, 58),
     1933 to  1947 => ( 59, 59),
     1948 to  1962 => ( 60, 59),
     1963 to  1977 => ( 60, 60),
     1978 to  1992 => ( 61, 60),
     1993 to  2007 => ( 61, 61),
     2008 to  2022 => ( 62, 61),
     2023 to  2037 => ( 62, 62),
     2038 to  2052 => ( 63, 62),
     2053 to  2067 => ( 63, 63),
     2068 to  2082 => ( 64, 63),
     2083 to  2097 => ( 64, 64),
     2098 to  2112 => ( 65, 64),
     2113 to  2127 => ( 65, 65),
     2128 to  2142 => ( 66, 65),
     2143 to  2157 => ( 66, 66),
     2158 to  2172 => ( 67, 66),
     2173 to  2187 => ( 67, 67),
     2188 to  2202 => ( 68, 67),
     2203 to  2217 => ( 68, 68),
     2218 to  2232 => ( 69, 68),
     2233 to  2247 => ( 69, 69),
     2248 to  2262 => ( 70, 69),
     2263 to  2277 => ( 70, 70),
     2278 to  2292 => ( 71, 70),
     2293 to  2307 => ( 71, 71),
     2308 to  2329 => ( 72, 71),
     2330 to  2344 => ( 72, 71),
     2345 to  2359 => ( 72, 72),
     2360 to  2374 => ( 73, 72),
     2375 to  2389 => ( 73, 73),
     2390 to  2404 => ( 74, 73),
     2405 to  2419 => ( 74, 74),
     2420 to  2434 => ( 75, 74),
     2435 to  2449 => ( 75, 75),
     2450 to  2464 => ( 76, 75),
     2465 to  2479 => ( 76, 76),
     2480 to  2494 => ( 77, 76),
     2495 to  2509 => ( 77, 77),
     2510 to  2524 => ( 78, 77),
     2525 to  2539 => ( 78, 78),
     2540 to  2554 => ( 79, 78),
     2555 to  2569 => ( 79, 79),
     2570 to  2584 => ( 80, 79),
     2585 to  2599 => ( 80, 80),
     2600 to  2614 => ( 81, 80),
     2615 to  2629 => ( 81, 81),
     2630 to  2644 => ( 82, 81),
     2645 to  2659 => ( 82, 82),
     2660 to  2674 => ( 83, 82),
     2675 to  2689 => ( 83, 83),
     2690 to  2704 => ( 84, 83),
     2705 to  2719 => ( 84, 84),
     2720 to  2734 => ( 85, 84),
     2735 to  2749 => ( 85, 85),
     2750 to  2764 => ( 86, 85),
     2765 to  2779 => ( 86, 86),
     2780 to  2794 => ( 87, 86),
     2795 to  2809 => ( 87, 87),
     2810 to  2824 => ( 88, 87),
     2825 to  2838 => ( 88, 88),
     2839 to  2853 => ( 89, 88),
     2854 to  2868 => ( 89, 89),
     2869 to  2883 => ( 90, 89),
     2884 to  2898 => ( 90, 90),
     2899 to  2913 => ( 91, 90),
     2914 to  2928 => ( 91, 91),
     2929 to  2943 => ( 92, 91),
     2944 to  2958 => ( 92, 92),
     2959 to  2973 => ( 93, 92),
     2974 to  2988 => ( 93, 93),
     2989 to  3003 => ( 94, 93),
     3004 to  3018 => ( 94, 94),
     3019 to  3033 => ( 95, 94),
     3034 to  3048 => ( 95, 95),
     3049 to  3063 => ( 96, 95),
     3064 to  3078 => ( 96, 96),
     3079 to  3093 => ( 97, 96),
     3094 to  3108 => ( 97, 97),
     3109 to  3123 => ( 98, 97),
     3124 to  3138 => ( 98, 98),
     3139 to  3153 => ( 99, 98),
     3154 to  3168 => ( 99, 99),
     3169 to  3183 => (100, 99),
     3184 to  3198 => (100,100),
     3199 to  3213 => (101,100),
     3214 to  3228 => (101,101),
     3229 to  3243 => (102,101),
     3244 to  3258 => (102,102),
     3259 to  3273 => (103,102),
     3274 to  3288 => (103,103),
     3289 to  3303 => (104,103),
     3304 to  3318 => (104,104),
     3319 to  3333 => (105,104),
     3334 to  3348 => (105,105),
     3349 to  3363 => (106,105),
     3364 to  3378 => (106,106),
     3379 to  3393 => (107,106),
     3394 to  3408 => (107,107),
     3409 to  3423 => (108,107),
     3424 to  3438 => (108,108),
     3439 to  3453 => (109,108),
     3454 to  3468 => (109,109),
     3469 to  3483 => (110,109),
     3484 to  3498 => (110,110),
     3499 to  3513 => (111,110),
     3514 to  3528 => (111,111),
     3529 to  3543 => (112,111),
     3544 to  3558 => (112,112),
     3559 to  3573 => (113,112),
     3574 to  3588 => (113,113),
     3589 to  3603 => (114,113),
     3604 to  3618 => (114,114),
     3619 to  3633 => (115,114),
     3634 to  3648 => (115,115),
     3649 to  3663 => (116,115),
     3664 to  3678 => (116,116),
     3679 to  3693 => (117,116),
     3694 to  3708 => (117,117),
     3709 to  3723 => (118,117),
     3724 to  3738 => (118,118),
     3739 to  3753 => (119,118),
     3754 to  3768 => (119,119),
     3769 to  3783 => (120,119),
     3784 to  3798 => (120,120),
     3799 to  3813 => (121,120),
     3814 to  3827 => (121,121),
     3828 to  3842 => (122,121),
     3843 to  3857 => (122,122),
     3858 to  3872 => (123,122),
     3873 to  3887 => (123,123),
     3888 to  3902 => (124,123),
     3903 to  3917 => (124,124),
     3918 to  3932 => (125,124),
     3933 to  3947 => (125,125),
     3948 to  3962 => (126,125),
     3963 to  3977 => (126,126),
     3978 to  3992 => (127,126),
     3993 to  4007 => (127,127),
     4008 to  4022 => (128,127),
     4023 to  4037 => (128,128),
     4038 to  4052 => (129,128),
     4053 to  4067 => (129,129),
     4068 to  4082 => (130,129),
     4083 to  4097 => (130,130),
     4098 to  4112 => (131,130),
     4113 to  4127 => (131,131),
     4128 to  4142 => (132,131),
     4143 to  4157 => (132,132),
     4158 to  4172 => (133,132),
     4173 to  4187 => (133,133),
     4188 to  4202 => (134,133),
     4203 to  4217 => (134,134),
     4218 to  4232 => (135,134),
     4233 to  4247 => (135,135),
     4248 to  4262 => (136,135),
     4263 to  4277 => (136,136),
     4278 to  4292 => (137,136),
     4293 to  4307 => (137,137),
     4308 to  4322 => (138,137),
     4323 to  4337 => (138,138),
     4338 to  4352 => (139,138),
     4353 to  4367 => (139,139),
     4368 to  4382 => (140,139),
     4383 to  4397 => (140,140),
     4398 to  4412 => (141,140),
     4413 to  4427 => (141,141),
     4428 to  4442 => (142,141),
     4443 to  4457 => (142,142),
     4458 to  4472 => (143,142),
     4473 to  4487 => (143,143),
     4488 to  4509 => (144,143),
     4510 to  4524 => (144,143),
     4525 to  4539 => (144,144),
     4540 to  4554 => (145,144),
     4555 to  4569 => (145,145),
     4570 to  4584 => (146,145),
     4585 to  4599 => (146,146),
     4600 to  4614 => (147,146),
     4615 to  4629 => (147,147),
     4630 to  4644 => (148,147),
     4645 to  4659 => (148,148),
     4660 to  4674 => (149,148),
     4675 to  4689 => (149,149),
     4690 to  4704 => (150,149),
     4705 to  4719 => (150,150),
     4720 to  4734 => (151,150),
     4735 to  4749 => (151,151),
     4750 to  4764 => (152,151),
     4765 to  4779 => (152,152),
     4780 to  4794 => (153,152),
     4795 to  4809 => (153,153),
     4810 to  4824 => (154,153),
     4825 to  4839 => (154,154),
     4840 to  4854 => (155,154),
     4855 to  4869 => (155,155),
     4870 to  4884 => (156,155),
     4885 to  4899 => (156,156),
     4900 to  4914 => (157,156),
     4915 to  4929 => (157,157),
     4930 to  4944 => (158,157),
     4945 to  4959 => (158,158),
     4960 to  4974 => (159,158),
     4975 to  4989 => (159,159),
     4990 to  5004 => (160,159),
     5005 to  5018 => (160,160),
     5019 to  5033 => (161,160),
     5034 to  5048 => (161,161),
     5049 to  5063 => (162,161),
     5064 to  5078 => (162,162),
     5079 to  5093 => (163,162),
     5094 to  5108 => (163,163),
     5109 to  5123 => (164,163),
     5124 to  5138 => (164,164),
     5139 to  5153 => (165,164),
     5154 to  5168 => (165,165),
     5169 to  5183 => (166,165),
     5184 to  5198 => (166,166),
     5199 to  5213 => (167,166),
     5214 to  5228 => (167,167),
     5229 to  5243 => (168,167),
     5244 to  5258 => (168,168),
     5259 to  5273 => (169,168),
     5274 to  5288 => (169,169),
     5289 to  5303 => (170,169),
     5304 to  5318 => (170,170),
     5319 to  5333 => (171,170),
     5334 to  5348 => (171,171),
     5349 to  5363 => (172,171),
     5364 to  5378 => (172,172),
     5379 to  5393 => (173,172),
     5394 to  5408 => (173,173),
     5409 to  5423 => (174,173),
     5424 to  5438 => (174,174),
     5439 to  5453 => (175,174),
     5454 to  5468 => (175,175),
     5469 to  5483 => (176,175),
     5484 to  5498 => (176,176),
     5499 to  5513 => (177,176),
     5514 to  5528 => (177,177),
     5529 to  5543 => (178,177),
     5544 to  5558 => (178,178),
     5559 to  5573 => (179,178),
     5574 to  5588 => (179,179),
     5589 to  5603 => (180,179),
     5604 to  5618 => (180,180),
     5619 to  5633 => (181,180),
     5634 to  5648 => (181,181),
     5649 to  5663 => (182,181),
     5664 to  5678 => (182,182),
     5679 to  5693 => (183,182),
     5694 to  5708 => (183,183),
     5709 to  5723 => (184,183),
     5724 to  5738 => (184,184),
     5739 to  5753 => (185,184),
     5754 to  5768 => (185,185),
     5769 to  5783 => (186,185),
     5784 to  5798 => (186,186),
     5799 to  5813 => (187,186),
     5814 to  5828 => (187,187),
     5829 to  5843 => (188,187),
     5844 to  5858 => (188,188),
     5859 to  5873 => (189,188),
     5874 to  5888 => (189,189),
     5889 to  5903 => (190,189),
     5904 to  5918 => (190,190),
     5919 to  5933 => (191,190),
     5934 to  5948 => (191,191),
     5949 to  5963 => (192,191),
     5964 to  5978 => (192,192),
     5979 to  5993 => (193,192),
     5994 to  6008 => (193,193),
     6009 to  6022 => (194,193),
     6023 to  6037 => (194,194),
     6038 to  6052 => (195,194),
     6053 to  6067 => (195,195),
     6068 to  6082 => (196,195),
     6083 to  6097 => (196,196),
     6098 to  6112 => (197,196),
     6113 to  6127 => (197,197),
     6128 to  6142 => (198,197),
     6143 to  6157 => (198,198),
     6158 to  6172 => (199,198),
     6173 to  6187 => (199,199),
     6188 to  6209 => (200,199),
     6210 to  6224 => (200,199),
     6225 to  6239 => (200,200),
     6240 to  6254 => (201,200),
     6255 to  6269 => (201,201),
     6270 to  6284 => (202,201),
     6285 to  6299 => (202,202),
     6300 to  6314 => (203,202),
     6315 to  6329 => (203,203),
     6330 to  6344 => (204,203),
     6345 to  6359 => (204,204),
     6360 to  6374 => (205,204),
     6375 to  6389 => (205,205),
     6390 to  6404 => (206,205),
     6405 to  6419 => (206,206),
     6420 to  6434 => (207,206),
     6435 to  6449 => (207,207),
     6450 to  6464 => (208,207),
     6465 to  6479 => (208,208),
     6480 to  6494 => (209,208),
     6495 to  6509 => (209,209),
     6510 to  6524 => (210,209),
     6525 to  6539 => (210,210),
     6540 to  6554 => (211,210),
     6555 to  6569 => (211,211),
     6570 to  6584 => (212,211),
     6585 to  6599 => (212,212),
     6600 to  6614 => (213,212),
     6615 to  6629 => (213,213),
     6630 to  6644 => (214,213),
     6645 to  6659 => (214,214),
     6660 to  6674 => (215,214),
     6675 to  6689 => (215,215),
     6690 to  6704 => (216,215),
     6705 to  6718 => (216,216),
     6719 to  6733 => (217,216),
     6734 to  6748 => (217,217),
     6749 to  6763 => (218,217),
     6764 to  6778 => (218,218),
     6779 to  6793 => (219,218),
     6794 to  6808 => (219,219),
     6809 to  6823 => (220,219),
     6824 to  6838 => (220,220),
     6839 to  6853 => (221,220),
     6854 to  6868 => (221,221),
     6869 to  6883 => (222,221),
     6884 to  6898 => (222,222),
     6899 to  6913 => (223,222),
     6914 to  6928 => (223,223),
     6929 to  6943 => (224,223),
     6944 to  6958 => (224,224),
     6959 to  6973 => (225,224),
     6974 to  6988 => (225,225),
     6989 to  7003 => (226,225),
     7004 to  7018 => (226,226),
     7019 to  7033 => (227,226),
     7034 to  7048 => (227,227),
     7049 to  7063 => (228,227),
     7064 to  7078 => (228,228),
     7079 to  7093 => (229,228),
     7094 to  7108 => (229,229),
     7109 to  7123 => (230,229),
     7124 to  7138 => (230,230),
     7139 to  7153 => (231,230),
     7154 to  7168 => (231,231),
     7169 to  7183 => (232,231),
     7184 to  7198 => (232,232),
     7199 to  7213 => (233,232),
     7214 to  7228 => (233,233),
     7229 to  7243 => (234,233),
     7244 to  7258 => (234,234),
     7259 to  7273 => (235,234),
     7274 to  7288 => (235,235),
     7289 to  7303 => (236,235),
     7304 to  7318 => (236,236),
     7319 to  7333 => (237,236),
     7334 to  7348 => (237,237),
     7349 to  7363 => (238,237),
     7364 to  7378 => (238,238),
     7379 to  7393 => (239,238),
     7394 to  7408 => (239,239),
     7409 to  7423 => (240,239),
     7424 to  7438 => (240,240),
     7439 to  7453 => (241,240),
     7454 to  7468 => (241,241),
     7469 to  7483 => (242,241),
     7484 to  7498 => (242,242),
     7499 to  7513 => (243,242),
     7514 to  7528 => (243,243),
     7529 to  7543 => (244,243),
     7544 to  7558 => (244,244),
     7559 to  7573 => (245,244),
     7574 to  7588 => (245,245),
     7589 to  7603 => (246,245),
     7604 to  7618 => (246,246),
     7619 to  7633 => (247,246),
     7634 to  7648 => (247,247),
     7649 to  7663 => (248,247),
     7664 to  7678 => (248,248),
     7679 to  7693 => (249,248),
     7694 to  7708 => (249,249),
     7709 to  7722 => (250,249),
     7723 to  7737 => (250,250),
     7738 to  7752 => (251,250),
     7753 to  7767 => (251,251),
     7768 to  7782 => (252,251),
     7783 to  7797 => (252,252),
     7798 to  7812 => (253,252),
     7813 to  7827 => (253,253),
     7828 to  7842 => (254,253),
     7843 to  7857 => (254,254),
     7858 to  7872 => (255,254),
     7873 to  7887 => (255,255),
     7888 to  7902 => (256,255),
     7903 to  7917 => (256,256),
     7918 to  7932 => (257,256),
     7933 to  7947 => (257,257),
     7948 to  7962 => (258,257),
     7963 to  7977 => (258,258),
     7978 to  7992 => (259,258),
     7993 to  8007 => (259,259),
     8008 to  8022 => (260,259),
     8023 to  8037 => (260,260),
     8038 to  8052 => (261,260),
     8053 to  8067 => (261,261),
     8068 to  8082 => (262,261),
     8083 to  8097 => (262,262),
     8098 to  8112 => (263,262),
     8113 to  8127 => (263,263),
     8128 to  8142 => (264,263),
     8143 to  8157 => (264,264),
     8158 to  8172 => (265,264),
     8173 to  8187 => (265,265),
     8188 to  8202 => (266,265),
     8203 to  8217 => (266,266),
     8218 to  8232 => (267,266),
     8233 to  8247 => (267,267),
     8248 to  8262 => (268,267),
     8263 to  8277 => (268,268),
     8278 to  8292 => (269,268),
     8293 to  8307 => (269,269),
     8308 to  8322 => (270,269),
     8323 to  8337 => (270,270),
     8338 to  8352 => (271,270),
     8353 to  8367 => (271,271),
     8368 to  8389 => (272,271),
     8390 to  8404 => (272,271),
     8405 to  8419 => (272,272),
     8420 to  8434 => (273,272),
     8435 to  8449 => (273,273),
     8450 to  8464 => (274,273),
     8465 to  8479 => (274,274),
     8480 to  8494 => (275,274),
     8495 to  8509 => (275,275),
     8510 to  8524 => (276,275),
     8525 to  8539 => (276,276),
     8540 to  8554 => (277,276),
     8555 to  8569 => (277,277),
     8570 to  8584 => (278,277),
     8585 to  8599 => (278,278),
     8600 to  8614 => (279,278),
     8615 to  8629 => (279,279),
     8630 to  8644 => (280,279),
     8645 to  8659 => (280,280),
     8660 to  8674 => (281,280),
     8675 to  8689 => (281,281),
     8690 to  8704 => (282,281),
     8705 to  8719 => (282,282),
     8720 to  8734 => (283,282),
     8735 to  8749 => (283,283),
     8750 to  8764 => (284,283),
     8765 to  8779 => (284,284),
     8780 to  8794 => (285,284),
     8795 to  8809 => (285,285),
     8810 to  8824 => (286,285),
     8825 to  8839 => (286,286),
     8840 to  8854 => (287,286),
     8855 to  8869 => (287,287),
     8870 to  8884 => (288,287),
     8885 to  8898 => (288,288),
     8899 to  8913 => (289,288),
     8914 to  8928 => (289,289),
     8929 to  8943 => (290,289),
     8944 to  8958 => (290,290),
     8959 to  8973 => (291,290),
     8974 to  8988 => (291,291),
     8989 to  9003 => (292,291),
     9004 to  9018 => (292,292),
     9019 to  9033 => (293,292),
     9034 to  9048 => (293,293),
     9049 to  9063 => (294,293),
     9064 to  9078 => (294,294),
     9079 to  9093 => (295,294),
     9094 to  9108 => (295,295),
     9109 to  9123 => (296,295),
     9124 to  9138 => (296,296),
     9139 to  9153 => (297,296),
     9154 to  9168 => (297,297),
     9169 to  9183 => (298,297),
     9184 to  9198 => (298,298),
     9199 to  9213 => (299,298),
     9214 to  9228 => (299,299),
     9229 to  9243 => (300,299),
     9244 to  9258 => (300,300),
     9259 to  9273 => (301,300),
     9274 to  9288 => (301,301),
     9289 to  9303 => (302,301),
     9304 to  9318 => (302,302),
     9319 to  9333 => (303,302),
     9334 to  9348 => (303,303),
     9349 to  9363 => (304,303),
     9364 to  9378 => (304,304),
     9379 to  9393 => (305,304),
     9394 to  9408 => (305,305),
     9409 to  9423 => (306,305),
     9424 to  9438 => (306,306),
     9439 to  9453 => (307,306),
     9454 to  9468 => (307,307),
     9469 to  9483 => (308,307),
     9484 to  9498 => (308,308),
     9499 to  9513 => (309,308),
     9514 to  9528 => (309,309),
     9529 to  9543 => (310,309),
     9544 to  9558 => (310,310),
     9559 to  9573 => (311,310),
     9574 to  9588 => (311,311),
     9589 to  9603 => (312,311),
     9604 to  9618 => (312,312),
     9619 to  9633 => (313,312),
     9634 to  9648 => (313,313),
     9649 to  9663 => (314,313),
     9664 to  9678 => (314,314),
     9679 to  9693 => (315,314),
     9694 to  9708 => (315,315),
     9709 to  9723 => (316,315),
     9724 to  9738 => (316,316),
     9739 to  9753 => (317,316),
     9754 to  9768 => (317,317),
     9769 to  9783 => (318,317),
     9784 to  9798 => (318,318),
     9799 to  9813 => (319,318),
     9814 to  9828 => (319,319),
     9829 to  9843 => (320,319),
     9844 to  9858 => (320,320),
     9859 to  9873 => (321,320),
     9874 to  9887 => (321,321),
     9888 to  9902 => (322,321),
     9903 to  9917 => (322,322),
     9918 to  9932 => (323,322),
     9933 to  9947 => (323,323),
     9948 to  9962 => (324,323),
     9963 to  9977 => (324,324),
     9978 to  9992 => (325,324),
     9993 to 10007 => (325,325),
    10008 to 10022 => (326,325),
    10023 to 10037 => (326,326),
    10038 to 10052 => (327,326),
    10053 to 10067 => (327,327),
    10068 to 10082 => (328,327),
    10083 to 10097 => (328,328),
    10098 to 10112 => (329,328),
    10113 to 10127 => (329,329),
    10128 to 10142 => (330,329),
    10143 to 10157 => (330,330),
    10158 to 10172 => (331,330),
    10173 to 10187 => (331,331),
    10188 to 10202 => (332,331),
    10203 to 10217 => (332,332),
    10218 to 10232 => (333,332),
    10233 to 10247 => (333,333),
    10248 to 10262 => (334,333),
    10263 to 10277 => (334,334),
    10278 to 10292 => (335,334),
    10293 to 10307 => (335,335),
    10308 to 10322 => (336,335),
    10323 to 10337 => (336,336),
    10338 to 10352 => (337,336),
    10353 to 10367 => (337,337),
    10368 to 10382 => (338,337),
    10383 to 10397 => (338,338),
    10398 to 10412 => (339,338),
    10413 to 10427 => (339,339),
    10428 to 10442 => (340,339),
    10443 to 10457 => (340,340),
    10458 to 10472 => (341,340),
    10473 to 10487 => (341,341),
    10488 to 10502 => (342,341),
    10503 to 10517 => (342,342),
    10518 to 10532 => (343,342),
    10533 to 10547 => (343,343),
    10548 to 10569 => (344,343),
    10570 to 10584 => (344,343),
    10585 to 10599 => (344,344),
    10600 to 10614 => (345,344),
    10615 to 10629 => (345,345),
    10630 to 10644 => (346,345),
    10645 to 10659 => (346,346),
    10660 to 10674 => (347,346),
    10675 to 10689 => (347,347),
    10690 to 10704 => (348,347),
    10705 to 10719 => (348,348),
    10720 to 10734 => (349,348),
    10735 to 10749 => (349,349),
    10750 to 10764 => (350,349),
    10765 to 10779 => (350,350),
    10780 to 10794 => (351,350),
    10795 to 10809 => (351,351),
    10810 to 10824 => (352,351),
    10825 to 10839 => (352,352),
    10840 to 10854 => (353,352),
    10855 to 10869 => (353,353),
    10870 to 10884 => (354,353),
    10885 to 10899 => (354,354),
    10900 to 10914 => (355,354),
    10915 to 10929 => (355,355),
    10930 to 10944 => (356,355),
    10945 to 10959 => (356,356),
    10960 to 10974 => (357,356),
    10975 to 10989 => (357,357),
    10990 to 11004 => (358,357),
    11005 to 11019 => (358,358),
    11020 to 11034 => (359,358),
    11035 to 11049 => (359,359),
    11050 to 11064 => (360,359),
    11065 to 11078 => (360,360),
    11079 to 11093 => (361,360),
    11094 to 11108 => (361,361),
    11109 to 11123 => (362,361),
    11124 to 11138 => (362,362),
    11139 to 11153 => (363,362),
    11154 to 11168 => (363,363),
    11169 to 11183 => (364,363),
    11184 to 11198 => (364,364),
    11199 to 11213 => (365,364),
    11214 to 11228 => (365,365),
    11229 to 11243 => (366,365),
    11244 to 11258 => (366,366),
    11259 to 11273 => (367,366),
    11274 to 11288 => (367,367),
    11289 to 11303 => (368,367),
    11304 to 11318 => (368,368),
    11319 to 11333 => (369,368),
    11334 to 11348 => (369,369),
    11349 to 11363 => (370,369),
    11364 to 11378 => (370,370),
    11379 to 11393 => (371,370),
    11394 to 11408 => (371,371),
    11409 to 11423 => (372,371),
    11424 to 11438 => (372,372),
    11439 to 11453 => (373,372),
    11454 to 11468 => (373,373),
    11469 to 11483 => (374,373),
    11484 to 11498 => (374,374),
    11499 to 11513 => (375,374),
    11514 to 11528 => (375,375),
    11529 to 11543 => (376,375),
    11544 to 11558 => (376,376),
    11559 to 11573 => (377,376),
    11574 to 11588 => (377,377),
    11589 to 11603 => (378,377),
    11604 to 11618 => (378,378),
    11619 to 11633 => (379,378),
    11634 to 11648 => (379,379),
    11649 to 11663 => (380,379),
    11664 to 11678 => (380,380),
    11679 to 11693 => (381,380),
    11694 to 11708 => (381,381),
    11709 to 11723 => (382,381),
    11724 to 11738 => (382,382),
    11739 to 11753 => (383,382),
    11754 to 11768 => (383,383),
    11769 to 11783 => (384,383),
    11784 to 11798 => (384,384),
    11799 to 11813 => (385,384),
    11814 to 11828 => (385,385),
    11829 to 11843 => (386,385),
    11844 to 11858 => (386,386),
    11859 to 11873 => (387,386),
    11874 to 11888 => (387,387),
    11889 to 11903 => (388,387),
    11904 to 11918 => (388,388),
    11919 to 11933 => (389,388),
    11934 to 11948 => (389,389),
    11949 to 11963 => (390,389),
    11964 to 11978 => (390,390),
    11979 to 11993 => (391,390),
    11994 to 12008 => (391,391),
    12009 to 12023 => (392,391),
    12024 to 12038 => (392,392),
    12039 to 12053 => (393,392),
    12054 to 12067 => (393,393),
    12068 to 12082 => (394,393),
    12083 to 12097 => (394,394),
    12098 to 12112 => (395,394),
    12113 to 12127 => (395,395),
    12128 to 12142 => (396,395),
    12143 to 12157 => (396,396),
    12158 to 12172 => (397,396),
    12173 to 12187 => (397,397),
    12188 to 12202 => (398,397),
    12203 to 12217 => (398,398),
    12218 to 12232 => (399,398),
    12233 to 12248 => (399,399)
  );

 end package roi_lut_BOLA3;