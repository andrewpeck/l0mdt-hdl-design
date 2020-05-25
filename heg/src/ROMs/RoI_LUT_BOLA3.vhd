--------------------------------------------------------------------------------
--  UMass , Physics Department               
--  Yuan-Tang Chou                           
--  yuan-tang.chou@cern.ch                         
--------------------------------------------------------------------------------
--  Project: ATLAS L0MDT Trigger             
--  Module: rpc_z to tube windows 
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

package RoI_LUT_BOLA3 is

  constant BOLA3_IN_MAX : integer := 12250;
  -- type trLUT_limits_t is array (0 to 1) of integer;
  -- type trLUT_layer_t is array (0 to 5) of trLUT_limits_t; -- 1 layer has up to 409 z position
  -- type trLUT_station_t is array (0 to 12250) of trLUT_layer_t; -- 1 station has up to 6 layers
  -- type trLut_sector_t is array ( 0 to 3) of trLUT_station_t; -- 1 sector has 4 station

  -- constant trLUT_s3o_rom_mem : roi_mdt_lut := (
  --   0 to 30 => ((0,1),(0,1),(0,1),(0,1),(0,1),(0,1)),  
  --   31 to 60 => ((0,2),(0,2),(0,2),(0,3),(0,3),(0,3)),  
  --   61 to 90 => ((0,3),(0,3),(0,3),(0,4),(0,4),(0,4)),  
  --   91 to 120 => ((0,4),(0,4),(0,4),(0,5),(0,5),(0,5)),  
  --   121 to 150 => ((0,5),(0,5),(0,5),(0,6),(0,6),(0,6)),  
  --   151 to 180 => ((0,6),(0,6),(0,6),(0,7),(0,7),(0,7)),  
  --   181 to 210 => ((0,7),(0,7),(0,7),(0,8),(0,8),(0,8)),  
  --   211 to 240 => ((0,8),(0,8),(0,8),(0,9),(0,9),(0,9)),  
  --   241 to 270 => ((0,9),(0,9),(0,9),(0,10),(0,10),(0,10)),  
  --   271 to 300 => ((0,10),(0,10),(0,10),(0,11),(0,11),(0,11)),  
  --   301 to 330 => ((0,11),(0,11),(0,11),(0,12),(0,12),(0,12)),  
  --   331 to 360 => ((0,12),(0,12),(0,12),(0,13),(0,13),(0,13)),  
  --   361 to 390 => ((0,13),(0,13),(0,13),(0,14),(0,14),(0,14)),  
  --   391 to 420 => ((0,14),(0,14),(0,14),(1,15),(1,15),(1,15)),  
  --   421 to 450 => ((1,15),(1,15),(1,15),(2,16),(2,16),(2,16)),  
  --   451 to 480 => ((2,16),(2,16),(2,16),(3,17),(3,17),(3,17)),  
  --   481 to 510 => ((3,17),(3,17),(3,17),(4,18),(4,18),(4,18)),  
  --   511 to 540 => ((4,18),(4,18),(4,18),(5,19),(5,19),(5,19)),  
  --   541 to 570 => ((5,19),(5,19),(5,19),(6,20),(6,20),(6,20)),  
  --   571 to 600 => ((6,20),(6,20),(6,20),(7,21),(7,21),(7,21)),  
  --   601 to 630 => ((7,21),(7,21),(7,21),(8,22),(8,22),(8,22)),  
  --   631 to 660 => ((8,22),(8,22),(8,22),(9,23),(9,23),(9,23)),  
  --   661 to 690 => ((9,23),(9,23),(9,23),(10,24),(10,24),(10,24)),  
  --   691 to 720 => ((10,24),(10,24),(10,24),(11,25),(11,25),(11,25)),  
  --   721 to 750 => ((11,25),(11,25),(11,25),(12,26),(12,26),(13,27)),  
  --   751 to 780 => ((11,25),(12,26),(12,26),(13,27),(13,27),(14,28)),  
  --   781 to 810 => ((12,26),(13,27),(13,27),(14,28),(15,29),(15,29)),  
  --   811 to 840 => ((13,27),(13,27),(14,28),(15,29),(16,30),(16,30)),  
  --   841 to 870 => ((14,28),(14,28),(15,29),(17,31),(17,31),(17,31)),  
  --   871 to 900 => ((15,29),(15,29),(15,29),(18,32),(18,32),(18,32)),  
  --   901 to 930 => ((16,30),(16,30),(16,30),(19,33),(19,33),(19,33)),  
  --   931 to 960 => ((17,31),(17,31),(17,31),(20,34),(20,34),(20,34)),  
  --   961 to 990 => ((18,32),(18,32),(18,32),(21,35),(21,35),(21,35)),  
  --   991 to 1020 => ((19,33),(19,33),(19,33),(22,36),(22,36),(22,36)),  
  --   1021 to 1050 => ((20,34),(20,34),(20,34),(23,37),(23,37),(23,37)),  
  --   1051 to 1080 => ((21,35),(21,35),(21,35),(24,38),(24,38),(24,38)),  
  --   1081 to 1110 => ((22,36),(22,36),(22,36),(25,39),(25,39),(25,39)),  
  --   1111 to 1140 => ((23,37),(23,37),(23,37),(26,40),(26,40),(26,40)),  
  --   1141 to 1170 => ((24,38),(24,38),(24,38),(27,41),(27,41),(27,41)),  
  --   1171 to 1200 => ((25,39),(25,39),(25,39),(28,42),(28,42),(28,42)),  
  --   1201 to 1230 => ((26,40),(26,40),(26,40),(29,43),(29,43),(29,43)),  
  --   1231 to 1260 => ((27,41),(27,41),(27,41),(30,44),(30,44),(30,44)),  
  --   1261 to 1290 => ((28,42),(28,42),(28,42),(31,45),(31,45),(31,45)),  
  --   1291 to 1320 => ((29,43),(29,43),(29,43),(32,46),(32,46),(32,46)),  
  --   1321 to 1350 => ((30,44),(30,44),(30,44),(33,47),(33,47),(33,47)),  
  --   1351 to 1380 => ((31,45),(31,45),(31,45),(34,48),(34,48),(34,48)),  
  --   1381 to 1410 => ((32,46),(32,46),(32,46),(35,49),(35,49),(35,49)),  
  --   1411 to 1440 => ((33,47),(33,47),(33,47),(36,50),(36,50),(37,51)),  
  --   1441 to 1470 => ((34,48),(34,48),(34,48),(37,51),(37,51),(38,52)),  
  --   1471 to 1500 => ((34,48),(35,49),(35,49),(38,52),(38,52),(39,53)),  
  --   1501 to 1530 => ((35,49),(36,50),(36,50),(39,53),(40,54),(40,54)),  
  --   1531 to 1560 => ((36,50),(37,51),(37,51),(40,54),(41,55),(41,55)),  
  --   1561 to 1590 => ((37,51),(38,52),(38,52),(41,55),(42,56),(42,56)),  
  --   1591 to 1620 => ((38,52),(38,52),(39,53),(42,56),(43,57),(43,57)),  
  --   1621 to 1650 => ((39,53),(39,53),(40,54),(43,57),(44,58),(44,58)),  
  --   1651 to 1680 => ((40,54),(40,54),(41,55),(45,59),(45,59),(45,59)),  
  --   1681 to 1710 => ((41,55),(41,55),(42,56),(46,60),(46,60),(46,60)),  
  --   1711 to 1740 => ((42,56),(42,56),(43,57),(47,61),(47,61),(47,61)),  
  --   1741 to 1770 => ((43,57),(43,57),(43,57),(48,62),(48,62),(48,62)),  
  --   1771 to 1800 => ((44,58),(44,58),(44,58),(49,63),(49,63),(49,63)),  
  --   1801 to 1830 => ((45,59),(45,59),(45,59),(50,64),(50,64),(50,64)),  
  --   1831 to 1860 => ((46,60),(46,60),(46,60),(51,65),(51,65),(51,65)),  
  --   1861 to 1890 => ((47,61),(47,61),(47,61),(52,66),(52,66),(52,66)),  
  --   1891 to 1920 => ((48,62),(48,62),(48,62),(53,67),(53,67),(53,67)),  
  --   1921 to 1950 => ((49,63),(49,63),(49,63),(54,68),(54,68),(54,68)),  
  --   1951 to 1980 => ((50,64),(50,64),(50,64),(55,69),(55,69),(55,69)),  
  --   1981 to 2010 => ((51,65),(51,65),(51,65),(56,70),(56,70),(56,70)),  
  --   2011 to 2040 => ((52,66),(52,66),(52,66),(57,71),(57,71),(57,71)),  
  --   2041 to 2070 => ((53,67),(53,67),(53,67),(58,72),(58,72),(58,72)),  
  --   2071 to 2100 => ((54,68),(54,68),(54,68),(59,72),(59,73),(59,73)),  
  --   2101 to 2130 => ((55,69),(55,69),(55,69),(60,73),(60,74),(61,74)),  
  --   2131 to 2160 => ((56,70),(56,70),(56,70),(61,74),(61,75),(62,75)),  
  --   2161 to 2190 => ((57,71),(57,71),(57,71),(62,75),(62,76),(63,76)),  
  --   2191 to 2220 => ((57,71),(58,72),(58,72),(63,76),(63,77),(64,77)),  
  --   2221 to 2250 => ((58,72),(59,72),(59,72),(64,77),(64,78),(65,78)),  
  --   2251 to 2280 => ((59,73),(60,73),(60,73),(65,79),(66,79),(66,79)),  
  --   2281 to 2310 => ((60,74),(61,74),(61,74),(66,80),(67,80),(67,80)),  
  --   2311 to 2340 => ((61,75),(62,75),(62,75),(67,81),(68,81),(68,81)),  
  --   2341 to 2370 => ((62,76),(63,76),(63,76),(68,82),(69,82),(69,82)),  
  --   2371 to 2400 => ((63,76),(63,77),(64,77),(69,83),(70,83),(70,83)),  
  --   2401 to 2430 => ((64,77),(64,78),(65,78),(70,84),(71,84),(71,84)),  
  --   2431 to 2460 => ((65,78),(65,79),(66,79),(71,85),(72,85),(72,85)),  
  --   2461 to 2490 => ((66,79),(66,80),(67,80),(72,86),(72,86),(72,86)),  
  --   2491 to 2520 => ((67,80),(67,81),(68,81),(73,87),(73,87),(73,87)),  
  --   2521 to 2550 => ((68,81),(68,82),(69,82),(74,88),(74,88),(74,88)),  
  --   2551 to 2580 => ((69,82),(69,83),(70,83),(75,89),(75,89),(75,89)),  
  --   2581 to 2610 => ((70,83),(70,83),(70,84),(76,90),(76,90),(76,90)),  
  --   2611 to 2640 => ((71,84),(71,84),(71,85),(77,91),(77,91),(78,92)),  
  --   2641 to 2670 => ((72,85),(72,85),(72,86),(78,92),(78,92),(79,93)),  
  --   2671 to 2700 => ((72,86),(72,86),(73,87),(79,93),(79,93),(80,94)),  
  --   2701 to 2730 => ((73,87),(73,87),(74,88),(80,94),(80,94),(81,95)),  
  --   2731 to 2760 => ((74,88),(74,88),(75,89),(81,95),(81,95),(82,96)),  
  --   2761 to 2790 => ((75,89),(75,89),(76,90),(82,96),(82,96),(83,97)),  
  --   2791 to 2820 => ((76,90),(76,90),(77,91),(83,97),(83,97),(84,98)),  
  --   2821 to 2850 => ((77,91),(77,91),(77,91),(84,98),(85,99),(85,99)),  
  --   2851 to 2880 => ((78,92),(78,92),(78,92),(85,99),(86,100),(86,100)),  
  --   2881 to 2910 => ((79,93),(79,93),(79,93),(86,100),(87,101),(87,101)),  
  --   2911 to 2940 => ((80,94),(80,94),(80,94),(87,101),(88,102),(88,102)),  
  --   2941 to 2970 => ((81,95),(81,95),(81,95),(88,102),(89,103),(89,103)),  
  --   2971 to 3000 => ((82,96),(82,96),(82,96),(89,103),(90,104),(90,104)),  
  --   3001 to 3030 => ((83,97),(83,97),(83,97),(90,104),(91,105),(91,105)),  
  --   3031 to 3060 => ((84,98),(84,98),(84,98),(91,105),(92,106),(92,106)),  
  --   3061 to 3090 => ((85,99),(85,99),(85,99),(93,107),(93,107),(93,107)),  
  --   3091 to 3120 => ((85,99),(86,100),(86,100),(94,108),(94,108),(94,108)),  
  --   3121 to 3150 => ((86,100),(87,101),(87,101),(95,109),(95,109),(95,109)),  
  --   3151 to 3180 => ((87,101),(88,102),(88,102),(96,110),(96,110),(96,110)),  
  --   3181 to 3210 => ((88,102),(89,103),(89,103),(97,111),(97,111),(97,111)),  
  --   3211 to 3240 => ((89,103),(90,104),(90,104),(98,112),(98,112),(98,112)),  
  --   3241 to 3270 => ((90,104),(91,105),(91,105),(99,113),(99,113),(99,113)),  
  --   3271 to 3300 => ((91,105),(92,106),(92,106),(100,114),(100,114),(100,114)),  
  --   3301 to 3330 => ((92,106),(93,107),(93,107),(101,115),(101,115),(102,116)),  
  --   3331 to 3360 => ((93,107),(94,108),(94,108),(102,116),(102,116),(103,117)),  
  --   3361 to 3390 => ((94,108),(94,108),(95,109),(103,117),(103,117),(104,118)),  
  --   3391 to 3420 => ((95,109),(95,109),(96,110),(104,118),(104,118),(105,119)),  
  --   3421 to 3450 => ((96,110),(96,110),(97,111),(105,119),(105,119),(106,120)),  
  --   3451 to 3480 => ((97,111),(97,111),(98,112),(106,120),(106,120),(107,121)),  
  --   3481 to 3510 => ((98,112),(98,112),(99,113),(107,121),(107,121),(108,122)),  
  --   3511 to 3540 => ((99,113),(99,113),(100,114),(108,122),(108,122),(109,123)),  
  --   3541 to 3570 => ((100,114),(100,114),(101,115),(109,123),(109,123),(110,124)),  
  --   3571 to 3600 => ((101,115),(101,115),(102,116),(110,124),(111,125),(111,125)),  
  --   3601 to 3630 => ((102,116),(102,116),(103,117),(111,125),(112,126),(112,126)),  
  --   3631 to 3660 => ((103,117),(103,117),(104,118),(112,126),(113,127),(113,127)),  
  --   3661 to 3690 => ((104,118),(104,118),(104,118),(113,127),(114,128),(114,128)),  
  --   3691 to 3720 => ((105,119),(105,119),(105,119),(114,128),(115,129),(115,129)),  
  --   3721 to 3750 => ((106,120),(106,120),(106,120),(115,129),(116,130),(116,130)),  
  --   3751 to 3780 => ((107,121),(107,121),(107,121),(116,130),(117,131),(117,131)),  
  --   3781 to 3810 => ((108,122),(108,122),(108,122),(117,131),(118,132),(118,132)),  
  --   3811 to 3840 => ((109,123),(109,123),(109,123),(118,132),(119,133),(119,133)),  
  --   3841 to 3870 => ((109,123),(110,124),(110,124),(119,133),(120,134),(120,134)),  
  --   3871 to 3900 => ((110,124),(111,125),(111,125),(121,135),(121,135),(121,135)),  
  --   3901 to 3930 => ((111,125),(112,126),(112,126),(122,136),(122,136),(122,136)),  
  --   3931 to 3960 => ((112,126),(113,127),(113,127),(123,137),(123,137),(123,137)),  
  --   3961 to 3990 => ((113,127),(114,128),(114,128),(124,138),(124,138),(124,138)),  
  --   3991 to 4020 => ((114,128),(115,129),(115,129),(125,139),(125,139),(126,140)),  
  --   4021 to 4050 => ((115,129),(116,130),(116,130),(126,140),(126,140),(127,141)),  
  --   4051 to 4080 => ((116,130),(117,131),(117,131),(127,141),(127,141),(128,142)),  
  --   4081 to 4110 => ((117,131),(118,132),(118,132),(128,142),(128,142),(129,143)),  
  --   4111 to 4140 => ((118,132),(119,133),(119,133),(129,143),(129,143),(130,144)),  
  --   4141 to 4170 => ((119,133),(119,133),(120,134),(130,144),(130,144),(131,144)),  
  --   4171 to 4200 => ((120,134),(120,134),(121,135),(131,144),(131,145),(132,145)),  
  --   4201 to 4230 => ((121,135),(121,135),(122,136),(132,145),(132,146),(133,146)),  
  --   4231 to 4260 => ((122,136),(122,136),(123,137),(133,146),(133,147),(134,147)),  
  --   4261 to 4290 => ((123,137),(123,137),(124,138),(134,147),(134,148),(135,148)),  
  --   4291 to 4320 => ((124,138),(124,138),(125,139),(135,148),(135,149),(136,149)),  
  --   4321 to 4350 => ((125,139),(125,139),(126,140),(136,149),(137,150),(137,150)),  
  --   4351 to 4380 => ((126,140),(126,140),(127,141),(137,150),(138,151),(138,151)),  
  --   4381 to 4410 => ((127,141),(127,141),(128,142),(138,151),(139,152),(139,152)),  
  --   4411 to 4440 => ((128,142),(128,142),(129,143),(139,152),(140,153),(140,153)),  
  --   4441 to 4470 => ((129,143),(129,143),(130,144),(140,153),(141,154),(141,154)),  
  --   4471 to 4500 => ((130,144),(130,144),(131,144),(141,155),(142,155),(142,155)),  
  --   4501 to 4530 => ((131,144),(131,144),(132,145),(142,156),(143,156),(143,157)),  
  --   4531 to 4560 => ((132,145),(132,145),(132,146),(143,157),(144,157),(144,158)),  
  --   4561 to 4590 => ((132,146),(133,146),(133,147),(144,158),(144,158),(145,159)),  
  --   4591 to 4620 => ((133,147),(134,147),(134,148),(145,159),(145,159),(146,160)),  
  --   4621 to 4650 => ((134,148),(135,148),(135,149),(146,160),(146,160),(147,161)),  
  --   4651 to 4680 => ((135,149),(136,149),(136,150),(147,161),(147,161),(148,162)),  
  --   4681 to 4710 => ((136,150),(137,150),(137,151),(148,162),(148,162),(149,163)),  
  --   4711 to 4740 => ((137,151),(138,151),(138,152),(149,163),(149,163),(150,164)),  
  --   4741 to 4770 => ((138,151),(139,152),(139,153),(150,164),(150,164),(151,165)),  
  --   4771 to 4800 => ((139,152),(140,153),(140,153),(151,165),(151,165),(152,166)),  
  --   4801 to 4830 => ((140,153),(141,154),(141,154),(152,166),(152,166),(153,167)),  
  --   4831 to 4860 => ((141,154),(142,155),(142,155),(153,167),(153,167),(154,168)),  
  --   4861 to 4890 => ((142,155),(143,156),(143,156),(154,168),(155,169),(155,169)),  
  --   4891 to 4920 => ((143,156),(144,157),(144,157),(155,169),(156,170),(156,170)),  
  --   4921 to 4950 => ((144,157),(144,158),(144,158),(156,170),(157,171),(157,171)),  
  --   4951 to 4980 => ((144,158),(145,159),(145,159),(157,171),(158,172),(158,172)),  
  --   4981 to 5010 => ((145,159),(146,160),(146,160),(158,172),(159,173),(159,173)),  
  --   5011 to 5040 => ((146,160),(147,161),(147,161),(159,173),(160,174),(160,174)),  
  --   5041 to 5070 => ((147,161),(148,162),(148,162),(160,174),(161,175),(161,175)),  
  --   5071 to 5100 => ((148,162),(149,163),(149,163),(161,175),(162,176),(162,176)),  
  --   5101 to 5130 => ((149,163),(150,164),(150,164),(162,176),(163,177),(163,177)),  
  --   5131 to 5160 => ((150,164),(150,164),(151,165),(163,177),(164,178),(164,178)),  
  --   5161 to 5190 => ((151,165),(151,165),(152,166),(164,178),(165,179),(165,179)),  
  --   5191 to 5220 => ((152,166),(152,166),(153,167),(165,179),(166,180),(167,181)),  
  --   5221 to 5250 => ((153,167),(153,167),(154,168),(166,180),(167,181),(168,182)),  
  --   5251 to 5280 => ((154,168),(154,168),(155,169),(167,181),(168,182),(169,183)),  
  --   5281 to 5310 => ((155,169),(155,169),(156,170),(169,183),(169,183),(170,184)),  
  --   5311 to 5340 => ((156,170),(156,170),(157,171),(170,184),(170,184),(171,185)),  
  --   5341 to 5370 => ((157,171),(157,171),(158,172),(171,185),(171,185),(172,186)),  
  --   5371 to 5400 => ((158,172),(158,172),(159,173),(172,186),(172,186),(173,187)),  
  --   5401 to 5430 => ((159,173),(159,173),(160,174),(173,187),(173,187),(174,188)),  
  --   5431 to 5460 => ((160,174),(160,174),(161,175),(174,188),(174,188),(175,189)),  
  --   5461 to 5490 => ((160,174),(161,175),(162,176),(175,189),(175,189),(176,190)),  
  --   5491 to 5520 => ((161,175),(162,176),(163,177),(176,190),(176,190),(177,191)),  
  --   5521 to 5550 => ((162,176),(163,177),(164,178),(177,191),(177,191),(178,192)),  
  --   5551 to 5580 => ((163,177),(164,178),(165,179),(178,192),(178,192),(179,193)),  
  --   5581 to 5610 => ((164,178),(165,179),(166,180),(179,193),(179,193),(180,194)),  
  --   5611 to 5640 => ((165,179),(166,180),(166,180),(180,194),(181,195),(181,195)),  
  --   5641 to 5670 => ((166,180),(167,181),(167,181),(181,195),(182,196),(182,196)),  
  --   5671 to 5700 => ((167,181),(168,182),(168,182),(182,196),(183,197),(183,197)),  
  --   5701 to 5730 => ((168,182),(169,183),(169,183),(183,197),(184,198),(184,198)),  
  --   5731 to 5760 => ((169,183),(170,184),(170,184),(184,198),(185,199),(185,199)),  
  --   5761 to 5790 => ((170,184),(171,185),(171,185),(185,199),(186,200),(186,200)),  
  --   5791 to 5820 => ((171,185),(172,186),(172,186),(186,200),(187,200),(187,201)),  
  --   5821 to 5850 => ((172,186),(173,187),(173,187),(187,200),(188,201),(188,202)),  
  --   5851 to 5880 => ((173,187),(174,188),(174,188),(188,201),(189,202),(189,203)),  
  --   5881 to 5910 => ((174,188),(175,189),(175,189),(189,203),(190,203),(191,204)),  
  --   5911 to 5940 => ((175,189),(176,190),(176,190),(190,204),(191,204),(192,205)),  
  --   5941 to 5970 => ((176,190),(176,190),(177,191),(191,205),(192,205),(193,206)),  
  --   5971 to 6000 => ((177,191),(177,191),(178,192),(192,206),(193,206),(194,207)),  
  --   6001 to 6030 => ((178,192),(178,192),(179,193),(193,207),(194,207),(195,208)),  
  --   6031 to 6060 => ((179,193),(179,193),(180,194),(194,208),(195,208),(196,209)),  
  --   6061 to 6090 => ((180,194),(180,194),(181,195),(195,209),(196,209),(197,210)),  
  --   6091 to 6120 => ((181,195),(181,195),(182,196),(197,210),(197,210),(198,211)),  
  --   6121 to 6150 => ((182,196),(182,196),(183,197),(198,211),(198,211),(199,212)),  
  --   6151 to 6180 => ((183,197),(183,197),(184,198),(199,212),(199,213),(200,213)),  
  --   6181 to 6210 => ((183,197),(184,198),(185,199),(200,213),(200,214),(200,214)),  
  --   6211 to 6240 => ((184,198),(185,199),(186,200),(200,214),(201,215),(201,215)),  
  --   6241 to 6270 => ((185,199),(186,200),(187,200),(201,215),(202,216),(202,216)),  
  --   6271 to 6300 => ((186,200),(187,200),(188,201),(202,216),(203,217),(203,217)),  
  --   6301 to 6330 => ((187,201),(188,201),(189,202),(203,217),(204,218),(204,218)),  
  --   6331 to 6360 => ((188,202),(189,202),(190,203),(204,218),(205,219),(205,219)),  
  --   6361 to 6390 => ((189,203),(190,203),(191,204),(205,219),(206,220),(206,220)),  
  --   6391 to 6420 => ((190,203),(191,204),(192,205),(206,220),(207,221),(208,222)),  
  --   6421 to 6450 => ((191,204),(192,205),(193,206),(207,221),(208,222),(209,223)),  
  --   6451 to 6480 => ((192,205),(193,206),(194,207),(208,222),(209,223),(210,224)),  
  --   6481 to 6510 => ((193,206),(194,207),(194,208),(209,223),(210,224),(211,225)),  
  --   6511 to 6540 => ((194,207),(195,208),(195,209),(210,224),(211,225),(212,226)),  
  --   6541 to 6570 => ((195,208),(196,209),(196,210),(211,225),(212,226),(213,227)),  
  --   6571 to 6600 => ((196,209),(197,210),(197,211),(212,226),(213,227),(214,228)),  
  --   6601 to 6630 => ((197,210),(198,211),(198,212),(213,227),(214,228),(215,229)),  
  --   6631 to 6660 => ((198,211),(199,212),(199,213),(214,228),(215,229),(216,230)),  
  --   6661 to 6690 => ((199,212),(200,213),(200,214),(215,229),(216,230),(217,231)),  
  --   6691 to 6720 => ((200,213),(200,214),(201,215),(217,231),(217,231),(218,232)),  
  --   6721 to 6750 => ((200,214),(201,215),(201,215),(218,232),(218,232),(219,233)),  
  --   6751 to 6780 => ((201,215),(202,216),(202,216),(219,233),(219,233),(220,234)),  
  --   6781 to 6810 => ((202,216),(203,217),(203,217),(220,234),(220,234),(221,235)),  
  --   6811 to 6840 => ((203,217),(204,218),(204,218),(221,235),(221,235),(222,236)),  
  --   6841 to 6870 => ((204,218),(205,219),(205,219),(222,236),(222,236),(223,237)),  
  --   6871 to 6900 => ((205,219),(206,220),(206,220),(223,237),(223,237),(224,238)),  
  --   6901 to 6930 => ((206,220),(207,221),(207,221),(224,238),(225,239),(225,239)),  
  --   6931 to 6960 => ((207,221),(207,221),(208,222),(225,239),(226,240),(226,240)),  
  --   6961 to 6990 => ((208,222),(208,222),(209,223),(226,240),(227,241),(227,241)),  
  --   6991 to 7020 => ((209,223),(209,223),(210,224),(227,241),(228,242),(228,242)),  
  --   7021 to 7050 => ((210,224),(210,224),(211,225),(228,242),(229,243),(229,243)),  
  --   7051 to 7080 => ((211,225),(211,225),(212,226),(229,243),(230,244),(230,244)),  
  --   7081 to 7110 => ((212,226),(212,226),(213,227),(230,244),(231,245),(232,246)),  
  --   7111 to 7140 => ((212,226),(213,227),(214,228),(231,245),(232,246),(233,247)),  
  --   7141 to 7170 => ((213,227),(214,228),(215,229),(232,246),(233,247),(234,248)),  
  --   7171 to 7200 => ((214,228),(215,229),(216,230),(233,247),(234,248),(235,249)),  
  --   7201 to 7230 => ((215,229),(216,230),(217,231),(234,248),(235,249),(236,250)),  
  --   7231 to 7260 => ((216,230),(217,231),(218,232),(235,249),(236,250),(237,251)),  
  --   7261 to 7290 => ((217,231),(218,232),(219,233),(236,250),(237,251),(238,252)),  
  --   7291 to 7320 => ((218,232),(219,233),(220,234),(237,251),(238,252),(239,253)),  
  --   7321 to 7350 => ((219,233),(220,234),(221,235),(238,252),(239,253),(240,254)),  
  --   7351 to 7380 => ((220,234),(221,235),(222,236),(239,253),(240,254),(241,255)),  
  --   7381 to 7410 => ((221,235),(222,236),(223,237),(240,254),(241,255),(242,256)),  
  --   7411 to 7440 => ((222,236),(223,237),(224,238),(241,255),(242,256),(243,257)),  
  --   7441 to 7470 => ((223,237),(224,238),(225,239),(242,256),(243,257),(244,258)),  
  --   7471 to 7500 => ((224,238),(225,239),(226,240),(243,257),(244,258),(245,259)),  
  --   7501 to 7530 => ((225,239),(226,240),(227,241),(245,259),(245,259),(246,260)),  
  --   7531 to 7560 => ((226,240),(227,241),(228,242),(246,260),(246,260),(247,261)),  
  --   7561 to 7590 => ((227,241),(228,242),(229,243),(247,261),(247,261),(248,262)),  
  --   7591 to 7620 => ((228,242),(229,243),(229,243),(248,262),(248,262),(249,263)),  
  --   7621 to 7650 => ((229,243),(230,244),(230,244),(249,263),(249,263),(250,264)),  
  --   7651 to 7680 => ((230,244),(231,245),(231,245),(250,264),(251,265),(251,265)),  
  --   7681 to 7710 => ((231,245),(232,246),(232,246),(251,265),(252,266),(252,266)),  
  --   7711 to 7740 => ((232,246),(232,246),(233,247),(252,266),(253,267),(253,267)),  
  --   7741 to 7770 => ((233,247),(233,247),(234,248),(253,267),(254,268),(254,268)),  
  --   7771 to 7800 => ((234,248),(234,248),(235,249),(254,268),(255,269),(256,270)),  
  --   7801 to 7830 => ((235,249),(235,249),(236,250),(255,269),(256,270),(257,271)),  
  --   7831 to 7860 => ((235,249),(236,250),(237,251),(256,270),(257,271),(258,272)),  
  --   7861 to 7890 => ((236,250),(237,251),(238,252),(257,271),(258,272),(259,272)),  
  --   7891 to 7920 => ((237,251),(238,252),(239,253),(258,272),(259,272),(260,273)),  
  --   7921 to 7950 => ((238,252),(239,253),(240,254),(259,272),(260,273),(261,274)),  
  --   7951 to 7980 => ((239,253),(240,254),(241,255),(260,273),(261,274),(262,275)),  
  --   7981 to 8010 => ((240,254),(241,255),(242,256),(261,274),(262,275),(263,276)),  
  --   8011 to 8040 => ((241,255),(242,256),(243,257),(262,275),(263,276),(264,277)),  
  --   8041 to 8070 => ((242,256),(243,257),(244,258),(263,276),(264,277),(265,278)),  
  --   8071 to 8100 => ((243,257),(244,258),(245,259),(264,277),(265,278),(266,279)),  
  --   8101 to 8130 => ((244,258),(245,259),(246,260),(265,279),(266,279),(267,280)),  
  --   8131 to 8160 => ((245,259),(246,260),(247,261),(266,280),(267,280),(268,281)),  
  --   8161 to 8190 => ((246,260),(247,261),(248,262),(267,281),(268,281),(269,282)),  
  --   8191 to 8220 => ((247,261),(248,262),(249,263),(268,282),(269,283),(270,283)),  
  --   8221 to 8250 => ((248,262),(249,263),(250,264),(269,283),(270,284),(271,284)),  
  --   8251 to 8280 => ((249,263),(250,264),(251,265),(270,284),(271,285),(272,285)),  
  --   8281 to 8310 => ((250,264),(251,265),(252,266),(271,285),(272,286),(273,287)),  
  --   8311 to 8340 => ((251,265),(252,266),(253,267),(272,286),(273,287),(274,288)),  
  --   8341 to 8370 => ((252,266),(253,267),(254,268),(273,287),(274,288),(275,289)),  
  --   8371 to 8400 => ((253,267),(254,268),(255,269),(274,288),(275,289),(276,290)),  
  --   8401 to 8430 => ((254,268),(255,269),(256,270),(275,289),(276,290),(277,291)),  
  --   8431 to 8460 => ((255,269),(256,270),(256,270),(276,290),(277,291),(278,292)),  
  --   8461 to 8490 => ((256,270),(257,271),(257,271),(277,291),(278,292),(279,293)),  
  --   8491 to 8520 => ((257,271),(258,272),(258,272),(278,292),(279,293),(280,294)),  
  --   8521 to 8550 => ((258,272),(258,272),(259,273),(279,293),(280,294),(281,295)),  
  --   8551 to 8580 => ((259,272),(259,273),(260,274),(280,294),(281,295),(282,296)),  
  --   8581 to 8610 => ((259,273),(260,274),(261,275),(281,295),(282,296),(283,297)),  
  --   8611 to 8640 => ((260,274),(261,275),(262,276),(282,296),(283,297),(284,298)),  
  --   8641 to 8670 => ((261,275),(262,276),(263,277),(283,297),(284,298),(285,299)),  
  --   8671 to 8700 => ((262,276),(263,277),(264,277),(284,298),(285,299),(286,300)),  
  --   8701 to 8730 => ((263,277),(264,277),(265,278),(285,299),(286,300),(287,301)),  
  --   8731 to 8760 => ((264,278),(265,278),(266,279),(286,300),(287,301),(288,302)),  
  --   8761 to 8790 => ((265,278),(266,279),(267,280),(287,301),(288,302),(289,303)),  
  --   8791 to 8820 => ((266,279),(267,280),(268,281),(288,302),(289,303),(290,304)),  
  --   8821 to 8850 => ((267,280),(268,281),(269,282),(289,303),(290,304),(291,305)),  
  --   8851 to 8880 => ((268,281),(269,282),(270,283),(290,304),(291,305),(292,306)),  
  --   8881 to 8910 => ((269,282),(270,283),(271,284),(291,305),(292,306),(293,307)),  
  --   8911 to 8940 => ((270,283),(271,284),(272,285),(293,307),(293,307),(294,308)),  
  --   8941 to 8970 => ((271,284),(272,285),(272,286),(294,308),(295,309),(295,309)),  
  --   8971 to 9000 => ((272,285),(272,286),(273,287),(295,309),(296,310),(297,311)),  
  --   9001 to 9030 => ((272,286),(273,287),(274,288),(296,310),(297,311),(298,312)),  
  --   9031 to 9060 => ((273,287),(274,288),(275,289),(297,311),(298,312),(299,313)),  
  --   9061 to 9090 => ((274,288),(275,289),(276,290),(298,312),(299,313),(300,314)),  
  --   9091 to 9120 => ((275,289),(276,290),(277,291),(299,313),(300,314),(301,315)),  
  --   9121 to 9150 => ((276,290),(277,291),(278,292),(300,314),(301,315),(302,316)),  
  --   9151 to 9180 => ((277,291),(278,292),(279,293),(301,315),(302,316),(303,317)),  
  --   9181 to 9210 => ((278,292),(279,293),(280,294),(302,316),(303,317),(304,318)),  
  --   9211 to 9240 => ((279,293),(280,294),(281,295),(303,317),(304,318),(305,319)),  
  --   9241 to 9270 => ((280,294),(281,295),(282,296),(304,318),(305,319),(306,320)),  
  --   9271 to 9300 => ((281,295),(282,296),(283,297),(305,319),(306,320),(307,321)),  
  --   9301 to 9330 => ((282,296),(283,297),(284,298),(306,320),(307,321),(308,322)),  
  --   9331 to 9360 => ((283,297),(284,298),(285,299),(307,321),(308,322),(309,323)),  
  --   9361 to 9390 => ((284,298),(285,299),(286,300),(308,322),(309,323),(310,324)),  
  --   9391 to 9420 => ((285,299),(286,300),(287,301),(309,323),(310,324),(311,325)),  
  --   9421 to 9450 => ((286,300),(287,301),(288,302),(310,324),(311,325),(312,326)),  
  --   9451 to 9480 => ((287,301),(288,302),(289,303),(311,325),(312,326),(313,327)),  
  --   9481 to 9510 => ((287,301),(289,303),(290,304),(312,326),(313,327),(314,328)),  
  --   9511 to 9540 => ((288,302),(289,303),(290,304),(313,327),(314,328),(315,329)),  
  --   9541 to 9570 => ((289,303),(290,304),(291,305),(314,328),(315,329),(316,330)),  
  --   9571 to 9600 => ((290,304),(291,305),(292,306),(315,329),(316,330),(317,331)),  
  --   9601 to 9630 => ((291,305),(292,306),(293,307),(316,330),(317,331),(318,332)),  
  --   9631 to 9660 => ((292,306),(293,307),(294,308),(317,331),(318,332),(319,333)),  
  --   9661 to 9690 => ((293,307),(294,308),(295,309),(318,332),(319,333),(321,335)),  
  --   9691 to 9720 => ((294,308),(295,309),(296,310),(319,333),(321,335),(322,336)),  
  --   9721 to 9750 => ((295,309),(296,310),(297,311),(321,335),(322,336),(323,337)),  
  --   9751 to 9780 => ((296,310),(297,311),(298,312),(322,336),(323,337),(324,338)),  
  --   9781 to 9810 => ((297,311),(298,312),(299,313),(323,337),(324,338),(325,339)),  
  --   9811 to 9840 => ((298,312),(299,313),(300,314),(324,338),(325,339),(326,340)),  
  --   9841 to 9870 => ((299,313),(300,314),(301,315),(325,339),(326,340),(327,341)),  
  --   9871 to 9900 => ((300,314),(301,315),(302,316),(326,340),(327,341),(328,342)),  
  --   9901 to 9930 => ((301,315),(302,316),(303,317),(327,341),(328,342),(329,343)),  
  --   9931 to 9960 => ((302,316),(303,317),(304,318),(328,342),(329,343),(330,344)),  
  --   9961 to 9990 => ((303,317),(304,318),(305,319),(329,343),(330,344),(331,344)),  
  --   9991 to 10020 => ((304,318),(305,319),(306,320),(330,344),(331,344),(332,345)),  
  --   10021 to 10050 => ((305,319),(306,320),(307,321),(331,344),(332,345),(333,346)),  
  --   10051 to 10080 => ((306,320),(307,321),(308,322),(332,345),(333,346),(334,347)),  
  --   10081 to 10110 => ((307,321),(308,322),(309,323),(333,346),(334,347),(335,348)),  
  --   10111 to 10140 => ((308,322),(309,323),(310,324),(334,347),(335,348),(336,349)),  
  --   10141 to 10170 => ((309,323),(310,324),(311,325),(335,348),(336,349),(337,350)),  
  --   10171 to 10200 => ((310,324),(311,325),(312,326),(336,349),(337,350),(338,352)),  
  --   10201 to 10230 => ((310,324),(312,326),(313,327),(337,350),(338,351),(339,353)),  
  --   10231 to 10260 => ((311,325),(313,327),(314,328),(338,351),(339,352),(340,354)),  
  --   10261 to 10290 => ((312,326),(314,328),(315,329),(339,352),(340,354),(341,355)),  
  --   10291 to 10320 => ((313,327),(314,328),(316,330),(340,353),(341,355),(342,356)),  
  --   10321 to 10350 => ((314,328),(315,329),(317,331),(341,355),(342,356),(343,357)),  
  --   10351 to 10380 => ((315,329),(316,330),(318,332),(342,356),(343,357),(344,358)),  
  --   10381 to 10410 => ((316,330),(317,331),(318,332),(343,357),(344,358),(345,359)),  
  --   10411 to 10440 => ((317,331),(318,332),(319,333),(344,358),(345,359),(346,360)),  
  --   10441 to 10470 => ((318,332),(319,333),(320,334),(345,359),(346,360),(347,361)),  
  --   10471 to 10500 => ((319,333),(320,334),(321,335),(346,360),(347,361),(348,362)),  
  --   10501 to 10530 => ((320,334),(321,335),(322,336),(347,361),(348,362),(349,363)),  
  --   10531 to 10560 => ((321,335),(322,336),(323,337),(348,362),(349,363),(350,364)),  
  --   10561 to 10590 => ((322,336),(323,337),(324,338),(349,363),(350,364),(351,365)),  
  --   10591 to 10620 => ((323,337),(324,338),(325,339),(350,364),(351,365),(352,366)),  
  --   10621 to 10650 => ((324,338),(325,339),(326,340),(351,365),(352,366),(353,367)),  
  --   10651 to 10680 => ((325,339),(326,340),(327,341),(352,366),(353,367),(354,368)),  
  --   10681 to 10710 => ((326,340),(327,341),(328,342),(353,367),(354,368),(355,369)),  
  --   10711 to 10740 => ((327,341),(328,342),(329,343),(354,368),(355,369),(356,370)),  
  --   10741 to 10770 => ((328,342),(329,343),(330,344),(355,369),(356,370),(357,371)),  
  --   10771 to 10800 => ((329,343),(330,344),(331,344),(356,370),(357,371),(358,372)),  
  --   10801 to 10830 => ((330,344),(331,344),(332,345),(357,371),(358,372),(359,373)),  
  --   10831 to 10860 => ((331,344),(332,345),(333,346),(358,372),(359,373),(360,374)),  
  --   10861 to 10890 => ((332,345),(333,346),(334,347),(359,373),(360,374),(362,376)),  
  --   10891 to 10920 => ((333,346),(334,347),(335,348),(360,374),(361,375),(363,377)),  
  --   10921 to 10950 => ((333,347),(335,348),(336,349),(361,375),(362,376),(364,378)),  
  --   10951 to 10980 => ((334,348),(336,349),(337,350),(362,376),(363,377),(365,379)),  
  --   10981 to 11010 => ((335,349),(337,350),(338,351),(363,377),(365,379),(366,380)),  
  --   11011 to 11040 => ((336,350),(338,351),(339,352),(364,378),(366,380),(367,381)),  
  --   11041 to 11070 => ((337,351),(339,352),(340,353),(365,379),(367,381),(368,382)),  
  --   11071 to 11100 => ((338,352),(339,353),(341,354),(366,380),(368,382),(369,383)),  
  --   11101 to 11130 => ((339,353),(340,354),(342,355),(367,381),(369,383),(370,384)),  
  --   11131 to 11160 => ((340,353),(341,355),(343,356),(369,383),(370,384),(371,385)),  
  --   11161 to 11190 => ((341,354),(342,356),(344,357),(370,384),(371,385),(372,386)),  
  --   11191 to 11220 => ((342,355),(343,357),(344,358),(371,385),(372,386),(373,387)),  
  --   11221 to 11250 => ((343,356),(344,358),(345,359),(372,386),(373,387),(374,388)),  
  --   11251 to 11280 => ((344,357),(345,359),(346,360),(373,387),(374,388),(375,389)),  
  --   11281 to 11310 => ((344,358),(345,359),(347,361),(374,388),(375,389),(376,390)),  
  --   11311 to 11340 => ((345,359),(346,360),(348,362),(375,389),(376,390),(377,391)),  
  --   11341 to 11370 => ((346,360),(347,361),(349,363),(376,390),(377,391),(378,392)),  
  --   11371 to 11400 => ((347,361),(348,362),(350,364),(377,391),(378,392),(379,393)),  
  --   11401 to 11430 => ((348,362),(349,363),(351,365),(378,392),(379,393),(380,394)),  
  --   11431 to 11460 => ((349,363),(350,364),(352,366),(379,393),(380,394),(381,395)),  
  --   11461 to 11490 => ((350,364),(351,365),(352,366),(380,394),(381,395),(382,396)),  
  --   11491 to 11520 => ((351,365),(352,366),(353,367),(381,395),(382,396),(383,397)),  
  --   11521 to 11550 => ((352,366),(353,367),(354,368),(382,396),(383,397),(384,398)),  
  --   11551 to 11580 => ((353,367),(354,368),(355,369),(383,397),(384,398),(386,400)),  
  --   11581 to 11610 => ((354,368),(355,369),(356,370),(384,398),(385,399),(387,401)),  
  --   11611 to 11640 => ((355,369),(356,370),(357,371),(385,399),(386,400),(388,402)),  
  --   11641 to 11670 => ((356,370),(357,371),(358,372),(386,400),(387,401),(389,403)),  
  --   11671 to 11700 => ((357,371),(358,372),(359,373),(387,401),(388,402),(390,404)),  
  --   11701 to 11730 => ((358,372),(359,373),(360,374),(388,402),(389,403),(391,405)),  
  --   11731 to 11760 => ((359,373),(360,374),(361,375),(389,403),(391,405),(392,406)),  
  --   11761 to 11790 => ((360,374),(361,375),(362,376),(390,404),(392,406),(393,407)),  
  --   11791 to 11820 => ((361,375),(362,376),(363,377),(391,405),(393,407),(394,408)),  
  --   11821 to 11850 => ((362,376),(363,377),(364,378),(392,406),(394,408),(395,409)),  
  --   11851 to 11880 => ((362,376),(364,378),(365,379),(393,407),(395,409),(396,410)),  
  --   11881 to 11910 => ((363,377),(365,379),(366,380),(394,408),(396,410),(397,411)),  
  --   11911 to 11940 => ((364,378),(366,380),(367,381),(395,409),(397,411),(398,412)),  
  --   11941 to 11970 => ((365,379),(367,381),(368,382),(396,410),(398,412),(399,413)),  
  --   11971 to 12000 => ((366,380),(368,382),(369,383),(398,412),(399,413),(400,414)),  
  --   12001 to 12030 => ((367,381),(369,383),(370,384),(399,413),(400,414),(401,415)),  
  --   12031 to 12060 => ((368,382),(370,384),(371,385),(400,414),(401,415),(402,416)),  
  --   12061 to 12090 => ((369,383),(370,384),(372,386),(401,415),(402,416),(403,417)),  
  --   12091 to 12120 => ((370,384),(371,385),(373,387),(402,416),(403,417),(404,418)),  
  --   12121 to 12150 => ((371,385),(372,386),(374,388),(403,417),(404,418),(405,419)),  
  --   12151 to 12180 => ((372,386),(373,387),(375,389),(404,418),(405,419),(406,420)),  
  --   12181 to 12210 => ((373,387),(374,388),(376,390),(405,419),(406,420),(407,421)),  
  --   12211 to 12250 => ((374,388),(375,389),(377,391),(406,420),(407,421),(408,422)),
  --   12251 to 13000 => ((0,0),(0,0),(0,0),(0,0),(0,0),(0,0))
  -- );

 end package RoI_LUT_BOLA3;



  -- all arrays same size : 13000
  -- not repeat index number