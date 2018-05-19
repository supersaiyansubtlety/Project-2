SELECT * FROM Sat_Curve;
SELECT * FROM All_Weapons;
SELECT * FROM Wep_Data;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS placeholder;
CREATE VIEW PLACEHOLDER AS
	SELECT ''
	;
SELECT * FROM placeholder;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS correlated_subQ;
CREATE VIEW correlated_subQ AS
	SELECT AW.* FROM All_Weapons AW
    WHERE EXISTS
    (
		SELECT SC.* FROM Sat_Curve SC
        WHERE SC.Lev_8 > AW.Phy_Crv
    )
	;
SELECT * FROM correlated_subQ;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS Q_DISTINCT;
CREATE VIEW Q_DISTINCT AS
	SELECT DISTINCT Wep_Name FROM All_Weapons;
	;
SELECT * FROM Q_DISTINCT;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS Q_GROUP;
CREATE VIEW Q_GROUP AS
	SELECT AW.Wep_Class, count(AW.Wep_Class) AS Count
    FROM All_Weapons AW
    GROUP BY AW.Wep_Class
	;
SELECT * FROM Q_GROUP;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS JOIN_GROUP_HAVING_derived;
CREATE VIEW JOIN_GROUP_HAVING_derived AS
	SELECT AW.Wep_Class, MAX(AW.Phy_Dmg) AS Max_Dmg, WC.Crv FROM All_Weapons AW
    JOIN Wep_Curve WC ON WC.Crv_Wep_Name = AW.Wep_Name AND WC.Crv_Wep_Infus = AW.Wep_Infus
    WHERE WC.Crv_Type = 'PHY'
    GROUP BY AW.Wep_Class
    HAVING Max_Dmg > 100
	;
SELECT * FROM JOIN_GROUP_HAVING_derived;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS Q_ORDER;
CREATE VIEW Q_ORDER AS
	SELECT * FROM All_Weapons
    ORDER BY Phy_Dmg DESC
	;
SELECT * FROM Q_ORDER;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS Q_UNION;
CREATE VIEW Q_UNION AS
	SELECT Wep_Crit AS Basic_Data FROM All_Weapons
    WHERE Wep_Name = 'Plastic Goose' AND Wep_Infus = 'Normal'
    UNION ALL
    SELECT Wep_Dur AS Basic_Data FROM All_Weapons
    WHERE Wep_Name = 'Plastic Goose' AND Wep_Infus = 'Normal'
	UNION ALL
    SELECT Wep_Weight AS Basic_Data FROM All_Weapons
    WHERE Wep_Name = 'Plastic Goose' AND Wep_Infus = 'Normal'
	;
SELECT * FROM Q_UNION;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS subQ_in_n_out;
CREATE VIEW subQ_in_n_out AS
	-- compare inner to outer
	SELECT AW.* FROM All_Weapons AW
    WHERE (SELECT count(aw.Phy_Dmg) FROM All_Weapons aw WHERE aw.Phy_Dmg > AW.Phy_Dmg AND aw.Phy_Dmg IS NOT NULL AND AW.Phy_Dmg IS NOT NULL) < 5 AND AW.Phy_Dmg IS NOT NULL
    ORDER BY AW.Phy_Dmg DESC
	;
SELECT * FROM subQ_in_n_out;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS subQ_in_JOIN;
CREATE VIEW subQ_in_JOIN AS
	SELECT WD.Wep_Name, WD.Wep_Infus, WC.Crv FROM Wep_Data WD
    LEFT JOIN Wep_Curve WC ON WC.Crv = (SELECT SC.Curve_Ind FROM Sat_Curve SC WHERE SC.Curve_Ind = WC.Crv) AND WC.Crv_Wep_Name = WD.Wep_Name AND WC.Crv_Wep_Infus = WD.Wep_Infus AND WC.Crv_Type = 'PHY'
	;
SELECT * FROM subQ_in_JOIN;
SELECT * FROM Wep_Curve;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS subQ_not_EXISTS;
CREATE VIEW subQ_not_EXISTS AS
	SELECT AW.* FROM All_Weapons AW
    WHERE EXISTS (SELECT AW.Luk_Coef FROM All_Weapons WHERE AW.Luk_Coef IS NOT NULL)
	;
SELECT * FROM subQ_not_EXISTS;
-- -------------------------------------------------------------------------------
DROP VIEW IF EXISTS subQ_not_IN;
CREATE VIEW subQ_not_IN AS
	SELECT AW.* FROM All_Weapons AW 
    WHERE AW.Str_Coef IN 
    (
		SELECT WSC.Coef FROM Wep_Scale_Coef WSC
        WHERE WSC.Coef_Type = 'STR' AND (
        WSC.Coef_Wep_Name = 'Hand Axe' OR 
        WSC.Coef_Wep_Name = 'Claw' OR 
        WSC.Coef_Wep_Name = 'Dagger')
	)
	AND 
    AW.Wep_Name != 'Hand Axe' AND 
	AW.Wep_Name != 'Claw' AND 
	AW.Wep_Name != 'Dagger'
	;
SELECT * FROM subQ_not_IN;