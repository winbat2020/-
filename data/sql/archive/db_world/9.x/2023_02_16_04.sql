-- DB update 2023_02_16_03 -> 2023_02_16_04
-- Ghostriders of Karabor (Counter-Clockwise Group)
SET @GUID := 77821;

-- Delete useless SAI and replace with addons
UPDATE `creature_template_addon` SET `bytes1` = 0, `bytes2` = 1, `auras` = '37509 37497' WHERE (`entry` = 21784);
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 21784;
DELETE FROM `smart_scripts` WHERE (`entryorguid` = 21784) AND (`source_type` = 0);

DELETE FROM `creature_addon` WHERE (`guid`=76082);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `visibilityDistanceType`, `auras`) VALUES
(76082, 760820, 0, 0, 1, 0, 0, '37509 37497');

-- Adds Counter-Clockwise spawns and pathing
DELETE FROM `creature` WHERE `id1`=21784 AND `guid` BETWEEN @GUID+0 AND @GUID+3;
INSERT INTO `creature` (`guid`, `id1`, `map`, `zoneId`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `MovementType`, `VerifiedBuild`) VALUES
(@GUID+0, 21784, 530, 3520, 0, -3819.457763671875, 748.92352294921875, 10.99925899505615234, 0.070442236959934234, 300, 0, 0, 48069),
(@GUID+1, 21784, 530, 3520, 0, -3815.6474609375, 749.24517822265625, 11.05895233154296875, 0.065464057028293609, 300, 0, 0, 48069),
(@GUID+2, 21784, 530, 3520, 0, -3821.62451171875, 748.836181640625, 11.10200881958007812, 0.06403488665819168, 300, 0, 0, 48069),
(@GUID+3, 21784, 530, 3520, 0, -3817.855712890625, 749.68603515625, 11.13191509246826171, 0.257404744625091552, 300, 0, 0, 48069);

DELETE FROM `creature_formations` WHERE `memberGUID` IN (@GUID+0, @GUID+1, @GUID+2, @GUID+3) AND `leaderGUID`=@GUID+0;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`) VALUES
(@GUID+0, @GUID+0, 0, 0, 2),
(@GUID+0, @GUID+1, 7, 180, 514),
(@GUID+0, @GUID+2, 7, 0, 514),
(@GUID+0, @GUID+3, 14, 0, 514);

SET @NPC := @GUID+0;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `wander_distance`=0,`MovementType`=2,`position_x`=-3582.0117,`position_y`=738.00085,`position_z`=-11.60027 WHERE `guid`=@NPC;
UPDATE `creature` SET `wander_distance`=0,`MovementType`=0,`position_x`=-3582.0117,`position_y`=738.00085,`position_z`=-11.60027 WHERE `guid` BETWEEN @GUID+1 AND @GUID+3;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`visibilityDistanceType`,`auras`) VALUES (@NPC,@PATH,0,0,1,0,0, '37509 37497');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_type`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-3582.0117,738.00085,-11.60027,NULL,0,1,0,100,0),
(@PATH,2,-3555.0117,736.999,-15.206091,NULL,0,1,0,100,0),
(@PATH,3,-3523.9648,739.6356,-24.99333,NULL,0,1,0,100,0),
(@PATH,4,-3497.655,743.2893,-31.746204,NULL,0,1,0,100,0),
(@PATH,5,-3475.0977,746.03796,-34.793076,NULL,0,1,0,100,0),
(@PATH,6,-3436.73,748.79034,-32.796745,NULL,0,1,0,100,0),
(@PATH,7,-3408.0854,748.2836,-36.34636,NULL,0,1,0,100,0),
(@PATH,8,-3383.3176,751.9549,-32.763138,NULL,0,1,0,100,0),
(@PATH,9,-3350.7744,758.35284,-27.62442,NULL,0,1,0,100,0),
(@PATH,10,-3311.8325,764.73505,-22.817963,NULL,0,1,0,100,0),
(@PATH,11,-3283.9106,770.69055,-20.497715,NULL,0,1,0,100,0),
(@PATH,12,-3263.689,779.30383,-19.28307,NULL,0,1,0,100,0),
(@PATH,13,-3242.6887,782.1927,-19.523304,NULL,0,1,0,100,0),
(@PATH,14,-3213.1897,780.7821,-19.802399,NULL,0,1,0,100,0),
(@PATH,15,-3184.148,778.73895,-20.848785,NULL,0,1,0,100,0),
(@PATH,16,-3159.3918,782.47876,-21.848217,NULL,0,1,0,100,0),
(@PATH,17,-3135.858,792.18317,-21.983227,NULL,0,1,0,100,0),
(@PATH,18,-3121.3635,807.0347,-22.550884,NULL,0,1,0,100,0),
(@PATH,19,-3110.7349,837.2576,-21.119303,NULL,0,1,0,100,0),
(@PATH,20,-3090.6934,860.93164,-20.413082,NULL,0,1,0,100,0),
(@PATH,21,-3086.6228,881.49695,-19.495127,NULL,0,1,0,100,0),
(@PATH,22,-3091.6887,914.3597,-18.61809,NULL,0,1,0,100,0),
(@PATH,23,-3097.855,942.389,-15.7861,NULL,0,1,0,100,0),
(@PATH,24,-3111.2188,959.85547,-12.459139,NULL,0,1,0,100,0),
(@PATH,25,-3116.3645,984.43695,-7.602827,NULL,0,1,0,100,0),
(@PATH,26,-3115.991,1009.3419,-1.9761763,NULL,0,1,0,100,0),
(@PATH,27,-3113.8875,1031.1473,3.3822222,NULL,0,1,0,100,0),
(@PATH,28,-3113.047,1051.9934,8.890436,NULL,0,1,0,100,0),
(@PATH,29,-3115.8875,1075.5958,15.084559,NULL,0,1,0,100,0),
(@PATH,30,-3121.8723,1090.9601,18.347866,NULL,0,1,0,100,0),
(@PATH,31,-3118.568,1109.29,21.958874,NULL,0,1,0,100,0),
(@PATH,32,-3114.959,1130.9893,24.531628,NULL,0,1,0,100,0),
(@PATH,33,-3116.3867,1168.0779,25.999382,NULL,0,1,0,100,0),
(@PATH,34,-3095.2922,1193.738,20.86491,NULL,0,1,0,100,0),
(@PATH,35,-3083.3381,1214.5853,16.09737,NULL,0,1,0,100,0),
(@PATH,36,-3083.523,1240.9,12.7167015,NULL,0,1,0,100,0),
(@PATH,37,-3069.565,1261.482,8.94656,NULL,0,1,0,100,0),
(@PATH,38,-3051.8108,1283.4492,14.047925,NULL,0,1,0,100,0),
(@PATH,39,-3029.4631,1306.8901,8.647018,NULL,0,1,0,100,0),
(@PATH,40,-3004.9902,1327.7563,8.398155,NULL,0,1,0,100,0),
(@PATH,41,-2988.193,1350.7687,9.718176,NULL,0,1,0,100,0),
(@PATH,42,-2987.539,1387.9454,11.595335,NULL,0,1,0,100,0),
(@PATH,43,-2984.721,1419.052,12.349408,NULL,0,1,0,100,0),
(@PATH,44,-2980.0815,1437.6061,12.02513,NULL,0,1,0,100,0),
(@PATH,45,-2947.8293,1453.4999,11.854938,NULL,0,1,0,100,0),
(@PATH,46,-2928.739,1472.8331,12.738223,NULL,0,1,0,100,0),
(@PATH,47,-2915.1843,1477.9686,13.301211,NULL,0,1,0,100,0),
(@PATH,48,-2899.6064,1484.0338,14.062313,NULL,0,1,0,100,0),
(@PATH,49,-2891.6455,1501.3971,16.361866,NULL,0,1,0,100,0),
(@PATH,50,-2884.9421,1523.7585,21.605066,NULL,0,1,0,100,0),
(@PATH,51,-2873.7993,1564.3153,15.587232,NULL,0,1,0,100,0),
(@PATH,52,-2870.468,1578.8677,15.672398,NULL,0,1,0,100,0),
(@PATH,53,-2857.2473,1595.7028,14.916075,NULL,0,1,0,100,0),
(@PATH,54,-2841.8616,1612.7998,13.600535,NULL,0,1,0,100,0),
(@PATH,55,-2825.668,1627.954,13.00577,NULL,0,1,0,100,0),
(@PATH,56,-2820.7559,1640.2091,13.511487,NULL,0,1,0,100,0),
(@PATH,57,-2821.572,1670.0314,18.706371,NULL,0,1,0,100,0),
(@PATH,58,-2823.1855,1683.9355,22.622631,NULL,0,1,0,100,0),
(@PATH,59,-2832.3555,1698.1925,27.174511,NULL,0,1,0,100,0),
(@PATH,60,-2850.1814,1708.6688,32.676376,NULL,0,1,0,100,0),
(@PATH,61,-2864.478,1707.7451,35.981064,NULL,0,1,0,100,0),
(@PATH,62,-2876.0574,1716.8547,38.347626,NULL,0,1,0,100,0),
(@PATH,63,-2882.9565,1742.1371,43.716034,NULL,0,1,0,100,0),
(@PATH,64,-2890.5344,1761.4727,48.10666,NULL,0,1,0,100,0),
(@PATH,65,-2902.9592,1782.6305,53.90005,NULL,0,1,0,100,0),
(@PATH,66,-2911.177,1802.306,60.47678,NULL,0,1,0,100,0),
(@PATH,67,-2918.327,1818.2008,67.8071,NULL,0,1,0,100,0),
(@PATH,68,-2927.1282,1832.0438,74.59665,NULL,0,1,0,100,0),
(@PATH,69,-2943.1077,1848.8529,84.22737,NULL,0,1,0,100,0),
(@PATH,70,-2949.2646,1858.1685,88.558304,NULL,0,1,0,100,0),
(@PATH,71,-2954.5918,1874.0885,93.99742,NULL,0,1,0,100,0),
(@PATH,72,-2955.1777,1886.0771,97.160995,NULL,0,1,0,100,0),
(@PATH,73,-2966.3418,1907.8889,103.50938,NULL,0,1,0,100,0),
(@PATH,74,-2983.3926,1913.6719,106.238396,NULL,0,1,0,100,0),
(@PATH,75,-3003.3296,1914.3873,108.55613,NULL,0,1,0,100,0),
(@PATH,76,-3021.864,1915.1549,110.53001,NULL,0,1,0,100,0),
(@PATH,77,-3040.5696,1924.1992,112.65802,NULL,0,1,0,100,0),
(@PATH,78,-3067.7712,1940.5625,110.8596,NULL,0,1,0,100,0),
(@PATH,79,-3084.0168,1957.625,108.3895,NULL,0,1,0,100,0),
(@PATH,80,-3094.934,1975.8186,103.72227,NULL,0,1,0,100,0),
(@PATH,81,-3107.3618,1995.9705,98.75629,NULL,0,1,0,100,0),
(@PATH,82,-3127.395,2011.118,95.060585,NULL,0,1,0,100,0),
(@PATH,83,-3145.0952,2035.0865,91.13515,NULL,0,1,0,100,0),
(@PATH,84,-3154.4106,2064.3984,85.091934,NULL,0,1,0,100,0),
(@PATH,85,-3165.4097,2090.8713,78.2907,NULL,0,1,0,100,0),
(@PATH,86,-3180.0928,2105.2795,74.66322,NULL,0,1,0,100,0),
(@PATH,87,-3183.9163,2132.2937,72.24159,NULL,0,1,0,100,0),
(@PATH,88,-3185.9082,2166.2275,69.39077,NULL,0,1,0,100,0),
(@PATH,89,-3190.555,2200.3708,64.61389,NULL,0,1,0,100,0),
(@PATH,90,-3209.5652,2229.8103,61.611267,NULL,0,1,0,100,0),
(@PATH,91,-3222.774,2256.2476,60.954983,NULL,0,1,0,100,0),
(@PATH,92,-3229.9875,2283.622,59.82189,NULL,0,1,0,100,0),
(@PATH,93,-3254.781,2289.5452,60.01627,NULL,0,1,0,100,0),
(@PATH,94,-3287.284,2280.2148,60.54257,NULL,0,1,0,100,0),
(@PATH,95,-3318.9583,2280.5662,60.957447,NULL,0,1,0,100,0),
(@PATH,96,-3334.6367,2279.0322,61.08214,NULL,0,1,0,100,0),
(@PATH,97,-3356.0842,2280.439,61.70714,NULL,0,1,0,100,0),
(@PATH,98,-3390.7852,2288.6924,62.45162,NULL,0,1,0,100,0),
(@PATH,99,-3432.105,2291.0093,63.95459,NULL,0,1,0,100,0),
(@PATH,100,-3459.0635,2287.3716,63.49482,NULL,0,1,0,100,0),
(@PATH,101,-3484.7544,2277.8838,64.76956,NULL,0,1,0,100,0),
(@PATH,102,-3518.2925,2275.475,67.45433,NULL,0,1,0,100,0),
(@PATH,103,-3533.47,2289.268,68.338264,NULL,0,1,0,100,0),
(@PATH,104,-3564.415,2310.2537,70.72118,NULL,0,1,0,100,0),
(@PATH,105,-3586.9258,2321.0938,72.65774,NULL,0,1,0,100,0),
(@PATH,106,-3619.1128,2314.7576,74.752235,NULL,0,1,0,100,0),
(@PATH,107,-3655.283,2316.3645,75.673836,NULL,0,1,0,100,0),
(@PATH,108,-3679.8582,2324.0464,76.05544,NULL,0,1,0,100,0),
(@PATH,109,-3686.4944,2345.6753,76.49172,NULL,0,1,0,100,0),
(@PATH,110,-3708.8047,2332.9731,76.40668,NULL,0,1,0,100,0),
(@PATH,111,-3725.7769,2299.8875,76.434105,NULL,0,1,0,100,0),
(@PATH,112,-3742.7925,2271.6106,76.75626,NULL,0,1,0,100,0),
(@PATH,113,-3742.004,2226.5261,76.874565,NULL,0,1,0,100,0),
(@PATH,114,-3741.3706,2195.8499,75.88122,NULL,0,1,0,100,0),
(@PATH,115,-3751.1272,2168.9712,75.63122,NULL,0,1,0,100,0),
(@PATH,116,-3753.1519,2140.9016,76.13715,NULL,0,1,0,100,0),
(@PATH,117,-3756.7126,2111.3694,77.23974,NULL,0,1,0,100,0),
(@PATH,118,-3752.5837,2091.0122,78.475334,NULL,0,1,0,100,0),
(@PATH,119,-3752.1387,2072.0117,80.20922,NULL,0,1,0,100,0),
(@PATH,120,-3755.4336,2054.5112,82.61487,NULL,0,1,0,100,0),
(@PATH,121,-3755.7239,2030.6869,84.53136,NULL,0,1,0,100,0),
(@PATH,122,-3765.3174,2016.2444,85.313705,NULL,0,1,0,100,0),
(@PATH,123,-3783.3508,1997.0756,85.08433,NULL,0,1,0,100,0),
(@PATH,124,-3799.6658,1979.3724,85.55808,NULL,0,1,0,100,0),
(@PATH,125,-3816.697,1959.4935,85.91917,NULL,0,1,0,100,0),
(@PATH,126,-3824.5,1936.44,85.93101,NULL,0,1,0,100,0),
(@PATH,127,-3832.629,1919.7522,85.76732,NULL,0,1,0,100,0),
(@PATH,128,-3841.763,1894.5513,86.151825,NULL,0,1,0,100,0),
(@PATH,129,-3847.7222,1871.7231,87.276825,NULL,0,1,0,100,0),
(@PATH,130,-3849.1125,1848.7759,88.85516,NULL,0,1,0,100,0),
(@PATH,131,-3855.0369,1816.8923,91.29085,NULL,0,1,0,100,0),
(@PATH,132,-3859.1584,1800.7324,92.463455,NULL,0,1,0,100,0),
(@PATH,133,-3871.3525,1781.5446,94.99746,NULL,0,1,0,100,0),
(@PATH,134,-3888.382,1768.2567,96.592064,NULL,0,1,0,100,0),
(@PATH,135,-3912.447,1753.6243,98.84891,NULL,0,1,0,100,0),
(@PATH,136,-3928.9736,1745.6226,98.811676,NULL,0,1,0,100,0),
(@PATH,137,-3948.1199,1731.9373,98.95314,NULL,0,1,0,100,0),
(@PATH,138,-3971.3762,1719.2325,98.42671,NULL,0,1,0,100,0),
(@PATH,139,-3994.591,1694.3868,96.65658,NULL,0,1,0,100,0),
(@PATH,140,-4019.2986,1671.7175,94.96815,NULL,0,1,0,100,0),
(@PATH,141,-4042.7864,1647.2351,94.4459,NULL,0,1,0,100,0),
(@PATH,142,-4053.7595,1618.9377,93.98786,NULL,0,1,0,100,0),
(@PATH,143,-4055.4792,1585.9011,97.43603,NULL,0,1,0,100,0),
(@PATH,144,-4054.496,1562.6348,100.34821,NULL,0,1,0,100,0),
(@PATH,145,-4056.428,1517.8992,91.81193,NULL,0,1,0,100,0),
(@PATH,146,-4052.5383,1490.919,88.903824,NULL,0,1,0,100,0),
(@PATH,147,-4054.3816,1457.9562,86.178566,NULL,0,1,0,100,0),
(@PATH,148,-4058.8274,1424.054,84.51471,NULL,0,1,0,100,0),
(@PATH,149,-4056.784,1402.6115,84.26471,NULL,0,1,0,100,0),
(@PATH,150,-4053.1711,1376.5989,84.72242,NULL,0,1,0,100,0),
(@PATH,151,-4047.0095,1347.4528,90.51227,NULL,0,1,0,100,0),
(@PATH,152,-4041.6316,1313.6207,86.84549,NULL,0,1,0,100,0),
(@PATH,153,-4034.7075,1274.2057,80.36119,NULL,0,1,0,100,0),
(@PATH,154,-4040.3052,1250.1128,75.77411,NULL,0,1,0,100,0),
(@PATH,155,-4044.1711,1228.2257,70.60931,NULL,0,1,0,100,0),
(@PATH,156,-4051.6997,1206.2372,64.14324,NULL,0,1,0,100,0),
(@PATH,157,-4051.033,1181.0485,56.85391,NULL,0,1,0,100,0),
(@PATH,158,-4036.7727,1165.146,51.403164,NULL,0,1,0,100,0),
(@PATH,159,-4016.6936,1152.6305,45.568237,NULL,0,1,0,100,0),
(@PATH,160,-3999.3496,1142.6895,40.69457,NULL,0,1,0,100,0),
(@PATH,161,-3990.227,1123.0391,35.944115,NULL,0,1,0,100,0),
(@PATH,162,-3979.3733,1102.0045,31.078268,NULL,0,1,0,100,0),
(@PATH,163,-3957.9575,1087.949,27.945192,NULL,0,1,0,100,0),
(@PATH,164,-3950.3577,1068.483,26.809206,NULL,0,1,0,100,0),
(@PATH,165,-3932.0112,1050.9928,25.952951,NULL,0,1,0,100,0),
(@PATH,166,-3914.2473,1031.0282,24.950785,NULL,0,1,0,100,0),
(@PATH,167,-3896.0269,1016.1782,23.950865,NULL,0,1,0,100,0),
(@PATH,168,-3883.1223,1005.5522,23.554625,NULL,0,1,0,100,0),
(@PATH,169,-3880.2673,969.4604,23.393902,NULL,0,1,0,100,0),
(@PATH,170,-3883.791,947.73926,22.075474,NULL,0,1,0,100,0),
(@PATH,171,-3884.158,925.04364,20.087063,NULL,0,1,0,100,0),
(@PATH,172,-3880.1401,908.9754,19.519314,NULL,0,1,0,100,0),
(@PATH,173,-3880.5508,892.58185,18.92548,NULL,0,1,0,100,0),
(@PATH,174,-3885.2126,875.7244,17.92841,NULL,0,1,0,100,0),
(@PATH,175,-3888.9866,850.8404,15.379325,NULL,0,1,0,100,0),
(@PATH,176,-3885.3499,832.82404,13.380096,NULL,0,1,0,100,0),
(@PATH,177,-3882.1016,809.5953,11.217621,NULL,0,1,0,100,0),
(@PATH,178,-3884.0886,790.5035,10.055253,NULL,0,1,0,100,0),
(@PATH,179,-3875.6504,768.0508,9.805253,NULL,0,1,0,100,0),
(@PATH,180,-3858.3767,752.1172,10.451253,NULL,0,1,0,100,0),
(@PATH,181,-3830.664,748.1328,11.006915,NULL,0,1,0,100,0),
(@PATH,182,-3796.352,750.55383,10.983474,NULL,0,1,0,100,0),
(@PATH,183,-3775.1267,747.28015,9.225661,NULL,0,1,0,100,0),
(@PATH,184,-3740.4004,751.55273,7.766179,NULL,0,1,0,100,0),
(@PATH,185,-3711.6086,748.41125,4.40273,NULL,0,1,0,100,0),
(@PATH,186,-3683.2083,737.7433,0.52083683,NULL,0,1,0,100,0),
(@PATH,187,-3663.0942,736.6085,-1.9690733,NULL,0,1,0,100,0),
(@PATH,188,-3644.5,729.26465,-4.058429,NULL,0,1,0,100,0),
(@PATH,189,-3626.748,728.89825,-6.407139,NULL,0,1,0,100,0),
(@PATH,190,-3609.681,734.6094,-9.436558,NULL,0,1,0,100,0);

-- Add pooling for both groups
DELETE FROM `pool_template` WHERE `entry` IN (105, 106, 107) AND `description` LIKE '%Ghostrider of Karabor (21784)%';
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
(105, 4, 'Ghostrider of Karabor (21784) - Clockwise Group'),
(106, 4, 'Ghostrider of Karabor (21784) - Counterclockwise Group'),
(107, 1, 'Ghostrider of Karabor (21784) - Master Pool');

DELETE FROM `pool_pool` WHERE `pool_id` IN (105, 106) AND `mother_pool`=107;
INSERT INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
(105, 107, 0, 'Ghostrider of Karabor (21784) - Clockwise Group'),
(106, 107, 0, 'Ghostrider of Karabor (21784) - Counterclockwise Group');

DELETE FROM `pool_creature` WHERE `pool_entry` IN (105, 106) AND `description` LIKE '%Ghostrider of Karabor (21784)%';
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(76082, 105, 0, 'Ghostrider of Karabor (21784) - Clockwise Group'),
(76083, 105, 0, 'Ghostrider of Karabor (21784) - Clockwise Group'),
(76084, 105, 0, 'Ghostrider of Karabor (21784) - Clockwise Group'),
(76085, 105, 0, 'Ghostrider of Karabor (21784) - Clockwise Group'),

(@GUID+0, 106, 0, 'Ghostrider of Karabor (21784) - Counterclockwise Group'),
(@GUID+1, 106, 0, 'Ghostrider of Karabor (21784) - Counterclockwise Group'),
(@GUID+2, 106, 0, 'Ghostrider of Karabor (21784) - Counterclockwise Group'),
(@GUID+3, 106, 0, 'Ghostrider of Karabor (21784) - Counterclockwise Group');
