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

package roi_lut_BILA3 is

    -- add length of constant array
    constant ROM_BILA3_Z_MAX_SIZE : integer := 6550;

    constant ROI_BILA3_Z_MEM : roi_z_lut_t(0 to ROM_BILA3_Z_MAX_SIZE - 1) := (

        0 to   329 => (  0,  0),
      330 to   344 => (  0,  0),
      345 to   359 => (  0,  0),
      360 to   374 => (  1,  0),
      375 to   389 => (  1,  1),
      390 to   404 => (  2,  1),
      405 to   419 => (  2,  2),
      420 to   434 => (  3,  2),
      435 to   449 => (  3,  3),
      450 to   464 => (  4,  3),
      465 to   479 => (  4,  4),
      480 to   494 => (  5,  4),
      495 to   509 => (  5,  5),
      510 to   524 => (  6,  5),
      525 to   539 => (  6,  6),
      540 to   554 => (  7,  6),
      555 to   569 => (  7,  7),
      570 to   584 => (  8,  7),
      585 to   599 => (  8,  8),
      600 to   614 => (  9,  8),
      615 to   629 => (  9,  9),
      630 to   644 => ( 10,  9),
      645 to   659 => ( 10, 10),
      660 to   674 => ( 11, 10),
      675 to   689 => ( 11, 11),
      690 to   704 => ( 12, 11),
      705 to   719 => ( 12, 12),
      720 to   734 => ( 13, 12),
      735 to   749 => ( 13, 13),
      750 to   764 => ( 14, 13),
      765 to   779 => ( 14, 14),
      780 to   794 => ( 15, 14),
      795 to   809 => ( 15, 15),
      810 to   824 => ( 16, 15),
      825 to   838 => ( 16, 16),
      839 to   853 => ( 17, 16),
      854 to   868 => ( 17, 17),
      869 to   883 => ( 18, 17),
      884 to   898 => ( 18, 18),
      899 to   913 => ( 19, 18),
      914 to   928 => ( 19, 19),
      929 to   943 => ( 20, 19),
      944 to   958 => ( 20, 20),
      959 to   973 => ( 21, 20),
      974 to   988 => ( 21, 21),
      989 to  1003 => ( 22, 21),
     1004 to  1018 => ( 22, 22),
     1019 to  1033 => ( 23, 22),
     1034 to  1048 => ( 23, 23),
     1049 to  1063 => ( 24, 23),
     1064 to  1078 => ( 24, 24),
     1079 to  1093 => ( 25, 24),
     1094 to  1108 => ( 25, 25),
     1109 to  1123 => ( 26, 25),
     1124 to  1138 => ( 26, 26),
     1139 to  1153 => ( 27, 26),
     1154 to  1168 => ( 27, 27),
     1169 to  1183 => ( 28, 27),
     1184 to  1198 => ( 28, 28),
     1199 to  1213 => ( 29, 28),
     1214 to  1228 => ( 29, 29),
     1229 to  1249 => ( 30, 29),
     1250 to  1264 => ( 30, 29),
     1265 to  1279 => ( 30, 30),
     1280 to  1294 => ( 31, 30),
     1295 to  1309 => ( 31, 31),
     1310 to  1324 => ( 32, 31),
     1325 to  1339 => ( 32, 32),
     1340 to  1354 => ( 33, 32),
     1355 to  1369 => ( 33, 33),
     1370 to  1384 => ( 34, 33),
     1385 to  1399 => ( 34, 34),
     1400 to  1414 => ( 35, 34),
     1415 to  1429 => ( 35, 35),
     1430 to  1444 => ( 36, 35),
     1445 to  1459 => ( 36, 36),
     1460 to  1474 => ( 37, 36),
     1475 to  1489 => ( 37, 37),
     1490 to  1504 => ( 38, 37),
     1505 to  1519 => ( 38, 38),
     1520 to  1534 => ( 39, 38),
     1535 to  1549 => ( 39, 39),
     1550 to  1564 => ( 40, 39),
     1565 to  1579 => ( 40, 40),
     1580 to  1594 => ( 41, 40),
     1595 to  1609 => ( 41, 41),
     1610 to  1624 => ( 42, 41),
     1625 to  1639 => ( 42, 42),
     1640 to  1654 => ( 43, 42),
     1655 to  1669 => ( 43, 43),
     1670 to  1684 => ( 44, 43),
     1685 to  1699 => ( 44, 44),
     1700 to  1714 => ( 45, 44),
     1715 to  1729 => ( 45, 45),
     1730 to  1744 => ( 46, 45),
     1745 to  1758 => ( 46, 46),
     1759 to  1773 => ( 47, 46),
     1774 to  1788 => ( 47, 47),
     1789 to  1803 => ( 48, 47),
     1804 to  1818 => ( 48, 48),
     1819 to  1833 => ( 49, 48),
     1834 to  1848 => ( 49, 49),
     1849 to  1863 => ( 50, 49),
     1864 to  1878 => ( 50, 50),
     1879 to  1893 => ( 51, 50),
     1894 to  1908 => ( 51, 51),
     1909 to  1923 => ( 52, 51),
     1924 to  1938 => ( 52, 52),
     1939 to  1953 => ( 53, 52),
     1954 to  1968 => ( 53, 53),
     1969 to  1983 => ( 54, 53),
     1984 to  1998 => ( 54, 54),
     1999 to  2013 => ( 55, 54),
     2014 to  2028 => ( 55, 55),
     2029 to  2043 => ( 56, 55),
     2044 to  2058 => ( 56, 56),
     2059 to  2073 => ( 57, 56),
     2074 to  2088 => ( 57, 57),
     2089 to  2103 => ( 58, 57),
     2104 to  2118 => ( 58, 58),
     2119 to  2133 => ( 59, 58),
     2134 to  2148 => ( 59, 59),
     2149 to  2163 => ( 60, 59),
     2164 to  2178 => ( 60, 60),
     2179 to  2193 => ( 61, 60),
     2194 to  2208 => ( 61, 61),
     2209 to  2223 => ( 62, 61),
     2224 to  2238 => ( 62, 62),
     2239 to  2253 => ( 63, 62),
     2254 to  2268 => ( 63, 63),
     2269 to  2283 => ( 64, 63),
     2284 to  2298 => ( 64, 64),
     2299 to  2313 => ( 65, 64),
     2314 to  2328 => ( 65, 65),
     2329 to  2349 => ( 66, 65),
     2350 to  2364 => ( 66, 65),
     2365 to  2379 => ( 66, 66),
     2380 to  2394 => ( 67, 66),
     2395 to  2409 => ( 67, 67),
     2410 to  2424 => ( 68, 67),
     2425 to  2439 => ( 68, 68),
     2440 to  2454 => ( 69, 68),
     2455 to  2469 => ( 69, 69),
     2470 to  2484 => ( 70, 69),
     2485 to  2499 => ( 70, 70),
     2500 to  2514 => ( 71, 70),
     2515 to  2529 => ( 71, 71),
     2530 to  2544 => ( 72, 71),
     2545 to  2559 => ( 72, 72),
     2560 to  2574 => ( 73, 72),
     2575 to  2589 => ( 73, 73),
     2590 to  2604 => ( 74, 73),
     2605 to  2619 => ( 74, 74),
     2620 to  2634 => ( 75, 74),
     2635 to  2649 => ( 75, 75),
     2650 to  2664 => ( 76, 75),
     2665 to  2679 => ( 76, 76),
     2680 to  2694 => ( 77, 76),
     2695 to  2709 => ( 77, 77),
     2710 to  2724 => ( 78, 77),
     2725 to  2739 => ( 78, 78),
     2740 to  2754 => ( 79, 78),
     2755 to  2769 => ( 79, 79),
     2770 to  2784 => ( 80, 79),
     2785 to  2799 => ( 80, 80),
     2800 to  2814 => ( 81, 80),
     2815 to  2829 => ( 81, 81),
     2830 to  2844 => ( 82, 81),
     2845 to  2858 => ( 82, 82),
     2859 to  2873 => ( 83, 82),
     2874 to  2888 => ( 83, 83),
     2889 to  2903 => ( 84, 83),
     2904 to  2918 => ( 84, 84),
     2919 to  2933 => ( 85, 84),
     2934 to  2948 => ( 85, 85),
     2949 to  2963 => ( 86, 85),
     2964 to  2978 => ( 86, 86),
     2979 to  2993 => ( 87, 86),
     2994 to  3008 => ( 87, 87),
     3009 to  3023 => ( 88, 87),
     3024 to  3038 => ( 88, 88),
     3039 to  3053 => ( 89, 88),
     3054 to  3068 => ( 89, 89),
     3069 to  3083 => ( 90, 89),
     3084 to  3098 => ( 90, 90),
     3099 to  3113 => ( 91, 90),
     3114 to  3128 => ( 91, 91),
     3129 to  3143 => ( 92, 91),
     3144 to  3158 => ( 92, 92),
     3159 to  3173 => ( 93, 92),
     3174 to  3188 => ( 93, 93),
     3189 to  3203 => ( 94, 93),
     3204 to  3218 => ( 94, 94),
     3219 to  3233 => ( 95, 94),
     3234 to  3248 => ( 95, 95),
     3249 to  3449 => ( 96, 95),
     3450 to  3464 => ( 96, 95),
     3465 to  3479 => ( 96, 96),
     3480 to  3494 => ( 97, 96),
     3495 to  3509 => ( 97, 97),
     3510 to  3524 => ( 98, 97),
     3525 to  3539 => ( 98, 98),
     3540 to  3554 => ( 99, 98),
     3555 to  3569 => ( 99, 99),
     3570 to  3584 => (100, 99),
     3585 to  3599 => (100,100),
     3600 to  3614 => (101,100),
     3615 to  3629 => (101,101),
     3630 to  3644 => (102,101),
     3645 to  3659 => (102,102),
     3660 to  3674 => (103,102),
     3675 to  3689 => (103,103),
     3690 to  3704 => (104,103),
     3705 to  3719 => (104,104),
     3720 to  3734 => (105,104),
     3735 to  3749 => (105,105),
     3750 to  3764 => (106,105),
     3765 to  3779 => (106,106),
     3780 to  3794 => (107,106),
     3795 to  3809 => (107,107),
     3810 to  3824 => (108,107),
     3825 to  3839 => (108,108),
     3840 to  3854 => (109,108),
     3855 to  3869 => (109,109),
     3870 to  3884 => (110,109),
     3885 to  3899 => (110,110),
     3900 to  3914 => (111,110),
     3915 to  3929 => (111,111),
     3930 to  3944 => (112,111),
     3945 to  3958 => (112,112),
     3959 to  3973 => (113,112),
     3974 to  3988 => (113,113),
     3989 to  4003 => (114,113),
     4004 to  4018 => (114,114),
     4019 to  4033 => (115,114),
     4034 to  4048 => (115,115),
     4049 to  4063 => (116,115),
     4064 to  4078 => (116,116),
     4079 to  4093 => (117,116),
     4094 to  4108 => (117,117),
     4109 to  4123 => (118,117),
     4124 to  4138 => (118,118),
     4139 to  4153 => (119,118),
     4154 to  4168 => (119,119),
     4169 to  4183 => (120,119),
     4184 to  4198 => (120,120),
     4199 to  4213 => (121,120),
     4214 to  4228 => (121,121),
     4229 to  4243 => (122,121),
     4244 to  4258 => (122,122),
     4259 to  4273 => (123,122),
     4274 to  4288 => (123,123),
     4289 to  4303 => (124,123),
     4304 to  4318 => (124,124),
     4319 to  4333 => (125,124),
     4334 to  4348 => (125,125),
     4349 to  4363 => (126,125),
     4364 to  4378 => (126,126),
     4379 to  4393 => (127,126),
     4394 to  4408 => (127,127),
     4409 to  4423 => (128,127),
     4424 to  4438 => (128,128),
     4439 to  4453 => (129,128),
     4454 to  4468 => (129,129),
     4469 to  4483 => (130,129),
     4484 to  4498 => (130,130),
     4499 to  4513 => (131,130),
     4514 to  4528 => (131,131),
     4529 to  4549 => (132,131),
     4550 to  4564 => (132,131),
     4565 to  4579 => (132,132),
     4580 to  4594 => (133,132),
     4595 to  4609 => (133,133),
     4610 to  4624 => (134,133),
     4625 to  4639 => (134,134),
     4640 to  4654 => (135,134),
     4655 to  4669 => (135,135),
     4670 to  4684 => (136,135),
     4685 to  4699 => (136,136),
     4700 to  4714 => (137,136),
     4715 to  4729 => (137,137),
     4730 to  4744 => (138,137),
     4745 to  4759 => (138,138),
     4760 to  4774 => (139,138),
     4775 to  4789 => (139,139),
     4790 to  4804 => (140,139),
     4805 to  4819 => (140,140),
     4820 to  4834 => (141,140),
     4835 to  4849 => (141,141),
     4850 to  4864 => (142,141),
     4865 to  4879 => (142,142),
     4880 to  4894 => (143,142),
     4895 to  4909 => (143,143),
     4910 to  4924 => (144,143),
     4925 to  4939 => (144,144),
     4940 to  4954 => (145,144),
     4955 to  4969 => (145,145),
     4970 to  4984 => (146,145),
     4985 to  4999 => (146,146),
     5000 to  5014 => (147,146),
     5015 to  5029 => (147,147),
     5030 to  5044 => (148,147),
     5045 to  5058 => (148,148),
     5059 to  5073 => (149,148),
     5074 to  5088 => (149,149),
     5089 to  5103 => (150,149),
     5104 to  5118 => (150,150),
     5119 to  5133 => (151,150),
     5134 to  5148 => (151,151),
     5149 to  5163 => (152,151),
     5164 to  5178 => (152,152),
     5179 to  5193 => (153,152),
     5194 to  5208 => (153,153),
     5209 to  5223 => (154,153),
     5224 to  5238 => (154,154),
     5239 to  5253 => (155,154),
     5254 to  5268 => (155,155),
     5269 to  5283 => (156,155),
     5284 to  5298 => (156,156),
     5299 to  5313 => (157,156),
     5314 to  5328 => (157,157),
     5329 to  5343 => (158,157),
     5344 to  5358 => (158,158),
     5359 to  5373 => (159,158),
     5374 to  5388 => (159,159),
     5389 to  5403 => (160,159),
     5404 to  5418 => (160,160),
     5419 to  5433 => (161,160),
     5434 to  5448 => (161,161),
     5449 to  5469 => (162,161),
     5470 to  5484 => (162,161),
     5485 to  5499 => (162,162),
     5500 to  5514 => (163,162),
     5515 to  5529 => (163,163),
     5530 to  5544 => (164,163),
     5545 to  5559 => (164,164),
     5560 to  5574 => (165,164),
     5575 to  5589 => (165,165),
     5590 to  5604 => (166,165),
     5605 to  5619 => (166,166),
     5620 to  5634 => (167,166),
     5635 to  5649 => (167,167),
     5650 to  5664 => (168,167),
     5665 to  5679 => (168,168),
     5680 to  5694 => (169,168),
     5695 to  5709 => (169,169),
     5710 to  5724 => (170,169),
     5725 to  5739 => (170,170),
     5740 to  5754 => (171,170),
     5755 to  5769 => (171,171),
     5770 to  5784 => (172,171),
     5785 to  5799 => (172,172),
     5800 to  5814 => (173,172),
     5815 to  5829 => (173,173),
     5830 to  5844 => (174,173),
     5845 to  5859 => (174,174),
     5860 to  5874 => (175,174),
     5875 to  5889 => (175,175),
     5890 to  5904 => (176,175),
     5905 to  5919 => (176,176),
     5920 to  5934 => (177,176),
     5935 to  5949 => (177,177),
     5950 to  5964 => (178,177),
     5965 to  5978 => (178,178),
     5979 to  5993 => (179,178),
     5994 to  6008 => (179,179),
     6009 to  6023 => (180,179),
     6024 to  6038 => (180,180),
     6039 to  6053 => (181,180),
     6054 to  6068 => (181,181),
     6069 to  6083 => (182,181),
     6084 to  6098 => (182,182),
     6099 to  6113 => (183,182),
     6114 to  6128 => (183,183),
     6129 to  6143 => (184,183),
     6144 to  6158 => (184,184),
     6159 to  6173 => (185,184),
     6174 to  6188 => (185,185),
     6189 to  6203 => (186,185),
     6204 to  6218 => (186,186),
     6219 to  6233 => (187,186),
     6234 to  6248 => (187,187),
     6249 to  6263 => (188,187),
     6264 to  6278 => (188,188),
     6279 to  6293 => (189,188),
     6294 to  6308 => (189,189),
     6309 to  6323 => (190,189),
     6324 to  6338 => (190,190),
     6339 to  6353 => (191,190),
     6354 to  6368 => (191,191),
     6369 to  6383 => (192,191),
     6384 to  6398 => (192,192),
     6399 to  6413 => (193,192),
     6414 to  6428 => (193,193),
     6429 to  6443 => (194,193),
     6444 to  6458 => (194,194),
     6459 to  6473 => (195,194),
     6474 to  6488 => (195,195),
     6489 to  6503 => (196,195),
     6504 to  6518 => (196,196),
     6519 to  6533 => (197,196),
     6534 to  6549 => (197,197)
  );

 end package roi_lut_BILA3;