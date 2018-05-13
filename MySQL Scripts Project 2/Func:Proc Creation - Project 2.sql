DROP PROCEDURE IF EXISTS insert_wep_data;
DELIMITER //
CREATE PROCEDURE insert_wep_data 
(
	_Wep_Name VARCHAR(100), 
    _Wep_Infus VARCHAR(10), 
    _Wep_Class VARCHAR(20),
    _Wep_Crit int,
    _Wep_Dur int,
    _Wep_Weight float,    
    
    -- 0=Scale, 1=Tinkling, 2=Normal
    _Up_Type int, 
    
    _Str_Coef int,
	_Dex_Coef int,
    _Int_Coef int,
    _Fat_Coef int,
    _Luk_Coef int,
    
    _Phy_Dmg float,
    _Mag_Dmg float,
    _Fir_Dmg float,
    _Lit_Dmg float,
    _Drk_Dmg float,
	
    _Str_Grade VARCHAR(1),
    _Dex_Grade VARCHAR(1),
    _Int_Grade VARCHAR(1),
    _Fat_Grade VARCHAR(1),
    
    _Str_Req int,
	_Dex_Req int,
    _Int_Req int,
	_Fat_Req int,
    
	_Phy_Crv int,
    _Mag_Crv int,
    _Fir_Crv int,
    _Lit_Crv int,
    _Drk_Crv int
)
BEGIN
	INSERT INTO Wep_Data (Wep_Name, Wep_Infus, Wep_Class, Wep_Crit, Wep_Dur, Wep_Weight)
    VALUES (_Wep_Name, _Wep_Infus, _Wep_Class, _Wep_Crit, _Wep_Dur, _Wep_Weight);
    -- check and insert type if not normal
    IF _Up_Type != 2 AND _Up_Type IS NOT NULL THEN
		INSERT INTO Wep_Up (Up_Wep_Name, Up_Wep_Infus, Is_Scale_Up)
        VALUES (_Wep_Name, _Wep_Infus, _Up_Type);
	END IF;
    
    -- Insert non-0 coeficients
    -- STR
    IF _Str_Coef != 0 AND _Str_Coef IS NOT NULL THEN INSERT INTO Wep_Scale_Coef (Coef_Wep_Name, Coef_Wep_Infus, Coef_Type, Coef)
    VALUES (_Wep_Name, _Wep_Infus, 'STR', _Str_Coef); END IF;
    -- DEX
    IF _Dex_Coef != 0 AND _Dex_Coef IS NOT NULL THEN INSERT INTO Wep_Scale_Coef (Coef_Wep_Name, Coef_Wep_Infus, Coef_Type, Coef)
    VALUES (_Wep_Name, _Wep_Infus, 'DEX', _Dex_Coef); END IF;
    -- INT
    IF _Int_Coef != 0 AND _Int_Coef IS NOT NULL THEN INSERT INTO Wep_Scale_Coef (Coef_Wep_Name, Coef_Wep_Infus, Coef_Type, Coef)
    VALUES (_Wep_Name, _Wep_Infus, 'INT', _Int_Coef); END IF;
    -- FAT
    IF _Fat_Coef != 0 AND _Fat_Coef IS NOT NULL THEN INSERT INTO Wep_Scale_Coef (Coef_Wep_Name, Coef_Wep_Infus, Coef_Type, Coef)
    VALUES (_Wep_Name, _Wep_Infus, 'FAT', _Fat_Coef); END IF;
    -- LUK
    IF _Luk_Coef != 0 AND _Luk_Coef IS NOT NULL THEN INSERT INTO Wep_Scale_Coef (Coef_Wep_Name, Coef_Wep_Infus, Coef_Type, Coef)
    VALUES (_Wep_Name, _Wep_Infus, 'LUK', _Luk_Coef); END IF;
    
    -- Insert non-0 damage
    -- PHY
    IF _Phy_Dmg != 0 AND _Phy_Dmg IS NOT NULL THEN INSERT INTO Base_Dmg (Dmg_Wep_Name, Dmg_Wep_Infus, Dmg_Type, Dmg)
    VALUES (_Wep_Name, _Wep_Infus, 'PHY', _Phy_Dmg); END IF;
    -- MAG
    IF _Mag_Dmg != 0 AND _Mag_Dmg IS NOT NULL THEN INSERT INTO Base_Dmg (Dmg_Wep_Name, Dmg_Wep_Infus, Dmg_Type, Dmg)
    VALUES (_Wep_Name, _Wep_Infus, 'MAG', _Mag_Dmg); END IF;
    -- FIR
    IF _Fir_Dmg != 0 AND _Fir_Dmg IS NOT NULL THEN INSERT INTO Base_Dmg (Dmg_Wep_Name, Dmg_Wep_Infus, Dmg_Type, Dmg)
    VALUES (_Wep_Name, _Wep_Infus, 'FIR', _Fir_Dmg); END IF;
    -- LIT
    IF _Lit_Dmg != 0 AND _Lit_Dmg IS NOT NULL THEN INSERT INTO Base_Dmg (Dmg_Wep_Name, Dmg_Wep_Infus, Dmg_Type, Dmg)
    VALUES (_Wep_Name, _Wep_Infus, 'LIT', _Lit_Dmg); END IF;
    -- DRK
    IF _Drk_Dmg != 0 AND _Drk_Dmg IS NOT NULL THEN INSERT INTO Base_Dmg (Dmg_Wep_Name, Dmg_Wep_Infus, Dmg_Type, Dmg)
    VALUES (_Wep_Name, _Wep_Infus, 'DRK', _Drk_Dmg); END IF;
    
    -- Insert non-null grade
    -- STR
    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    IF _Str_Grade != '-' AND _Str_Grade IS NOT NULL THEN INSERT INTO Scale_Grade (Grade_Wep_Name, Grade_Wep_Infus, Grade_Type, Grade)
    VALUES (_Wep_Name, _Wep_Infus, 'STR', _Str_Grade); END IF;
    -- DEX
    IF _Dex_Grade != '-' AND _Dex_Grade IS NOT NULL THEN INSERT INTO Scale_Grade (Grade_Wep_Name, Grade_Wep_Infus, Grade_Type, Grade)
    VALUES (_Wep_Name, _Wep_Infus, 'DEX', _Dex_Grade); END IF;
    -- INT
    IF _Int_Grade != '-' AND _Int_Grade IS NOT NULL THEN INSERT INTO Scale_Grade (Grade_Wep_Name, Grade_Wep_Infus, Grade_Type, Grade)
    VALUES (_Wep_Name, _Wep_Infus, 'INT', _Int_Grade); END IF;
    -- FAT
    IF _Fat_Grade != '-' AND _Fat_Grade IS NOT NULL THEN INSERT INTO Scale_Grade (Grade_Wep_Name, Grade_Wep_Infus, Grade_Type, Grade)
    VALUES (_Wep_Name, _Wep_Infus, 'FAT', _Fat_Grade); END IF;
        
    -- Insert non-0 requirement
    -- STR
    IF _Str_Req != 0 AND _Str_Req IS NOT NULL THEN INSERT INTO Reqs (Req_Wep_Name, Req_Wep_Infus, Req_Type, Req)
    VALUES (_Wep_Name, _Wep_Infus, 'STR', _Str_Req); END IF;
    -- DEX
    IF _Dex_Req != 0 AND _Dex_Req IS NOT NULL THEN INSERT INTO Reqs (Req_Wep_Name, Req_Wep_Infus, Req_Type, Req)
    VALUES (_Wep_Name, _Wep_Infus, 'DEX', _Dex_Req); END IF;
    -- INT
    IF _Int_Req != 0 AND _Int_Req IS NOT NULL THEN INSERT INTO Reqs (Req_Wep_Name, Req_Wep_Infus, Req_Type, Req)
    VALUES (_Wep_Name, _Wep_Infus, 'INT', _Int_Req); END IF;
    -- FAT
    IF _Fat_Req != 0 AND _Fat_Req IS NOT NULL THEN INSERT INTO Reqs (Req_Wep_Name, Req_Wep_Infus, Req_Type, Req)
    VALUES (_Wep_Name, _Wep_Infus, 'FAT', _Fat_Req); END IF;
    
    -- Insert non-0 indices
    -- PHY
    IF _Phy_Crv != 0 AND _Phy_Crv IS NOT NULL THEN INSERT INTO Wep_Curve (Crv_Wep_Name, Crv_Wep_Infus, Crv_Type, Crv)
    VALUES (_Wep_Name, _Wep_Infus, 'PHY', _Phy_Crv); END IF;
    -- MAG
    IF _Mag_Crv != 0 AND _Mag_Crv IS NOT NULL THEN INSERT INTO Wep_Curve (Crv_Wep_Name, Crv_Wep_Infus, Crv_Type, Crv)
    VALUES (_Wep_Name, _Wep_Infus, 'MAG', _Mag_Crv); END IF;
    -- FIR
    IF _Fir_Crv != 0 AND _Fir_Crv IS NOT NULL THEN INSERT INTO Wep_Curve (Crv_Wep_Name, Crv_Wep_Infus, Crv_Type, Crv)
    VALUES (_Wep_Name, _Wep_Infus, 'FIR', _Fir_Crv); END IF;
    -- LIT
    IF _Lit_Crv != 0 AND _Lit_Crv IS NOT NULL THEN INSERT INTO Wep_Curve (Crv_Wep_Name, Crv_Wep_Infus, Crv_Type, Crv)
    VALUES (_Wep_Name, _Wep_Infus, 'LIT', _Lit_Crv); END IF;
    -- DRK
    IF _Drk_Crv != 0 AND _Drk_Crv IS NOT NULL THEN INSERT INTO Wep_Curve (Crv_Wep_Name, Crv_Wep_Infus, Crv_Type, Crv)
    VALUES (_Wep_Name, _Wep_Infus, 'DRK', _Drk_Crv); END IF;
END //
DELIMITER ;






DROP PROCEDURE IF EXISTS insert_sat_curve;
DELIMITER //
CREATE PROCEDURE insert_sat_curve 
(
	_Curve_Ind int, 
				   _Lev_1  float, _Lev_2  float, _Lev_3  float, _Lev_4  float, 
	_Lev_5  float, _Lev_6  float, _Lev_7  float, _Lev_8  float, _Lev_9  float,  
    _Lev_10 float, _Lev_11 float, _Lev_12 float, _Lev_13 float, _Lev_14 float, 
    _Lev_15 float, _Lev_16 float, _Lev_17 float, _Lev_18 float, _Lev_19 float,  
    _Lev_20 float, _Lev_21 float, _Lev_22 float, _Lev_23 float, _Lev_24 float, 
    _Lev_25 float, _Lev_26 float, _Lev_27 float, _Lev_28 float, _Lev_29 float, 
    _Lev_30 float, _Lev_31 float, _Lev_32 float, _Lev_33 float, _Lev_34 float, 
    _Lev_35 float, _Lev_36 float, _Lev_37 float, _Lev_38 float, _Lev_39 float, 
    _Lev_40 float, _Lev_41 float, _Lev_42 float, _Lev_43 float, _Lev_44 float, 
    _Lev_45 float, _Lev_46 float, _Lev_47 float, _Lev_48 float, _Lev_49 float, 
    _Lev_50 float, _Lev_51 float, _Lev_52 float, _Lev_53 float, _Lev_54 float, 
    _Lev_55 float, _Lev_56 float, _Lev_57 float, _Lev_58 float, _Lev_59 float, 
    _Lev_60 float, _Lev_61 float, _Lev_62 float, _Lev_63 float, _Lev_64 float, 
    _Lev_65 float, _Lev_66 float, _Lev_67 float, _Lev_68 float, _Lev_69 float, 
    _Lev_70 float, _Lev_71 float, _Lev_72 float, _Lev_73 float, _Lev_74 float, 
    _Lev_75 float, _Lev_76 float, _Lev_77 float, _Lev_78 float, _Lev_79 float, 
    _Lev_80 float, _Lev_81 float, _Lev_82 float, _Lev_83 float, _Lev_84 float, 
    _Lev_85 float, _Lev_86 float, _Lev_87 float, _Lev_88 float, _Lev_89 float, 
    _Lev_90 float, _Lev_91 float, _Lev_92 float, _Lev_93 float, _Lev_94 float, 
    _Lev_95 float, _Lev_96 float, _Lev_97 float, _Lev_98 float, _Lev_99 float
)
BEGIN
	INSERT INTO Sat_Curve () VALUES 
    (
		_Curve_Ind, 
				 _Lev_1 , _Lev_2 , _Lev_3 , _Lev_4 , _Lev_5 , _Lev_6 , _Lev_7 , _Lev_8 , _Lev_9 ,  
		_Lev_10, _Lev_11, _Lev_12, _Lev_13, _Lev_14, _Lev_15, _Lev_16, _Lev_17, _Lev_18, _Lev_19,  
		_Lev_20, _Lev_21, _Lev_22, _Lev_23, _Lev_24, _Lev_25, _Lev_26, _Lev_27, _Lev_28, _Lev_29, 
		_Lev_30, _Lev_31, _Lev_32, _Lev_33, _Lev_34, _Lev_35, _Lev_36, _Lev_37, _Lev_38, _Lev_39, 
		_Lev_40, _Lev_41, _Lev_42, _Lev_43, _Lev_44, _Lev_45, _Lev_46, _Lev_47, _Lev_48, _Lev_49, 
		_Lev_50, _Lev_51, _Lev_52, _Lev_53, _Lev_54, _Lev_55, _Lev_56, _Lev_57, _Lev_58, _Lev_59, 
		_Lev_60, _Lev_61, _Lev_62, _Lev_63, _Lev_64, _Lev_65, _Lev_66, _Lev_67, _Lev_68, _Lev_69, 
		_Lev_70, _Lev_71, _Lev_72, _Lev_73, _Lev_74, _Lev_75, _Lev_76, _Lev_77, _Lev_78, _Lev_79, 
		_Lev_80, _Lev_81, _Lev_82, _Lev_83, _Lev_84, _Lev_85, _Lev_86, _Lev_87, _Lev_88, _Lev_89, 
		_Lev_90, _Lev_91, _Lev_92, _Lev_93, _Lev_94, _Lev_95, _Lev_96, _Lev_97, _Lev_98, _Lev_99
	);
END //
DELIMITER ;

DROP VIEW IF EXISTS All_Weapons;
CREATE VIEW All_Weapons AS
	SELECT W.*, 
    
 	U.Is_Scale_Up,
    
	SS.Coef AS Str_Coef,
    SD.Coef AS Dex_Coef,
    SI.Coef AS Int_Coef,
    SF.Coef AS Fat_Coef,
    SL.Coef AS Luk_Coef,
    
    DP.Dmg AS Phy_Dmg,
    DM.Dmg AS Mag_Dmg,
    DF.Dmg AS Fir_Dmg,
    DL.Dmg AS Lit_Dmg,
    DD.Dmg AS Drk_Dmg,
    
    GS.Grade AS Str_Grad, 
    GD.Grade AS Dex_Grad,
    GI.Grade AS Int_Grad,
    GF.Grade AS Fat_Grad,

    RS.Req AS Str_Req,
    RD.Req AS Dex_Req,
    RI.Req AS Int_Req,
    RF.Req AS Fat_Req,

    CP.Crv AS Phy_Crv,
    CM.Crv AS Dex_Crv,
    CF.Crv AS Fir_Crv,
    CL.Crv AS Lit_Crv,
    CD.Crv AS Drk_Crv

	FROM Wep_Data W
    
    LEFT JOIN Wep_Up U ON U.Up_Wep_Name = W.Wep_Name AND U.Up_Wep_Infus = W.Wep_Infus
    
    LEFT JOIN Wep_Scale_Coef SS  ON SS.Coef_Wep_Name = W.Wep_Name AND SS.Coef_Wep_Infus = W.Wep_Infus AND SS.Coef_Type = 'STR'
    LEFT JOIN Wep_Scale_Coef SD  ON SD.Coef_Wep_Name = W.Wep_Name AND SD.Coef_Wep_Infus = W.Wep_Infus AND SD.Coef_Type = 'DEX'
    LEFT JOIN Wep_Scale_Coef SI  ON SI.Coef_Wep_Name = W.Wep_Name AND SI.Coef_Wep_Infus = W.Wep_Infus AND SI.Coef_Type = 'INT'
    LEFT JOIN Wep_Scale_Coef SF  ON SF.Coef_Wep_Name = W.Wep_Name AND SF.Coef_Wep_Infus = W.Wep_Infus AND SF.Coef_Type = 'FAT'
    LEFT JOIN Wep_Scale_Coef SL  ON SL.Coef_Wep_Name = W.Wep_Name AND SL.Coef_Wep_Infus = W.Wep_Infus AND SL.Coef_Type = 'LUK'

    LEFT JOIN Base_Dmg AS DP ON DP.Dmg_Wep_Name = W.Wep_Name AND DP.Dmg_Wep_Infus = W.Wep_Infus AND DP.Dmg_Type = 'PHY'
    LEFT JOIN Base_Dmg AS DM ON DM.Dmg_Wep_Name = W.Wep_Name AND DM.Dmg_Wep_Infus = W.Wep_Infus AND DM.Dmg_Type = 'MAG'
    LEFT JOIN Base_Dmg AS DF ON DF.Dmg_Wep_Name = W.Wep_Name AND DF.Dmg_Wep_Infus = W.Wep_Infus AND DF.Dmg_Type = 'FIR'
    LEFT JOIN Base_Dmg AS DL ON DL.Dmg_Wep_Name = W.Wep_Name AND DL.Dmg_Wep_Infus = W.Wep_Infus AND DL.Dmg_Type = 'LIT'
    LEFT JOIN Base_Dmg AS DD ON DD.Dmg_Wep_Name = W.Wep_Name AND DD.Dmg_Wep_Infus = W.Wep_Infus AND DD.Dmg_Type = 'DRK'
    
    LEFT JOIN Scale_Grade GS ON GS.Grade_Wep_Name = W.Wep_Name AND GS.Grade_Wep_Infus = W.Wep_Infus AND GS.Grade_Type = 'STR'
    LEFT JOIN Scale_Grade GD ON GD.Grade_Wep_Name = W.Wep_Name AND GD.Grade_Wep_Infus = W.Wep_Infus AND GD.Grade_Type = 'DEX'
    LEFT JOIN Scale_Grade GI ON GI.Grade_Wep_Name = W.Wep_Name AND GI.Grade_Wep_Infus = W.Wep_Infus AND GI.Grade_Type = 'INT'
    LEFT JOIN Scale_Grade GF ON GF.Grade_Wep_Name = W.Wep_Name AND GF.Grade_Wep_Infus = W.Wep_Infus AND GF.Grade_Type = 'FAT'

    LEFT JOIN Reqs RS ON RS.Req_Wep_Name = W.Wep_Name AND RS.Req_Wep_Infus = W.Wep_Infus AND RS.Req_Type = 'STR'
	LEFT JOIN Reqs RD ON RD.Req_Wep_Name = W.Wep_Name AND RD.Req_Wep_Infus = W.Wep_Infus AND RD.Req_Type = 'DEX'
    LEFT JOIN Reqs RI ON RI.Req_Wep_Name = W.Wep_Name AND RI.Req_Wep_Infus = W.Wep_Infus AND RI.Req_Type = 'INT'
    LEFT JOIN Reqs RF ON RF.Req_Wep_Name = W.Wep_Name AND RF.Req_Wep_Infus = W.Wep_Infus AND RF.Req_Type = 'FAT'

    LEFT JOIN Wep_Curve CP ON CP.Crv_Wep_Name = W.Wep_Name AND CP.Crv_Wep_Infus = W.Wep_Infus AND CP.Crv_Type = 'PHY'
    LEFT JOIN Wep_Curve CM ON CM.Crv_Wep_Name = W.Wep_Name AND CM.Crv_Wep_Infus = W.Wep_Infus AND CM.Crv_Type = 'MAG'
    LEFT JOIN Wep_Curve CF ON CF.Crv_Wep_Name = W.Wep_Name AND CF.Crv_Wep_Infus = W.Wep_Infus AND CF.Crv_Type = 'FIR'
    LEFT JOIN Wep_Curve CL ON CL.Crv_Wep_Name = W.Wep_Name AND CL.Crv_Wep_Infus = W.Wep_Infus AND CL.Crv_Type = 'LIT'
    LEFT JOIN Wep_Curve CD ON CD.Crv_Wep_Name = W.Wep_Name AND CD.Crv_Wep_Infus = W.Wep_Infus AND CD.Crv_Type = 'DRK'
    
    ORDER BY W.Wep_Class, W.Wep_Name, W.Wep_Infus;

DROP PROCEDURE IF EXISTS get_wep_info;
DELIMITER //
CREATE PROCEDURE get_wep_info (_Name VARCHAR (100), _Infus VARCHAR(10))
BEGIN
	SELECT * FROM All_Weapons
    WHERE Wep_Name = _Name AND Wep_Infus = _Infus;
END //
DELIMITER ;



DROP PROCEDURE IF EXISTS get_class_wep_info;
DELIMITER //
CREATE PROCEDURE get_class_wep_info (_Class VARCHAR(20))
BEGIN
	SELECT * FROM All_Weapons
    WHERE Wep_Class = _Class
    ORDER BY Wep_Infus;
END //
DELIMITER ;

