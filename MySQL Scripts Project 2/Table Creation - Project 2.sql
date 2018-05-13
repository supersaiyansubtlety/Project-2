DROP TABLE IF EXISTS Wep_Curve;
DROP TABLE IF EXISTS Reqs;
DROP TABLE IF EXISTS Scale_Grade;
DROP TABLE IF EXISTS Base_Dmg;
DROP TABLE IF EXISTS Wep_Scale_Coef;
DROP TABLE IF EXISTS Wep_Up;
DROP TABLE IF EXISTS Sat_Curve;
DROP TABLE IF EXISTS Wep_Data;


DROP TABLE IF EXISTS Wep_Data;
CREATE TABLE Wep_Data
(
	Wep_Name VARCHAR(100),
    Wep_Infus VARCHAR(10),
    Wep_Class VARCHAR(20),
    Wep_Crit int,
    Wep_Dur int,
    Wep_Weight float,
    PRIMARY KEY (Wep_Name, Wep_Infus)
);

DROP TABLE IF EXISTS Sat_Curve;
CREATE TABLE Sat_Curve
(
	Curve_Ind int PRIMARY KEY,
				  Lev_1  float, Lev_2  float, Lev_3  float, Lev_4  float, 
	Lev_5  float, Lev_6  float, Lev_7  float, Lev_8  float, Lev_9  float,  
    Lev_10 float, Lev_11 float, Lev_12 float, Lev_13 float, Lev_14 float, 
    Lev_15 float, Lev_16 float, Lev_17 float, Lev_18 float, Lev_19 float,  
    Lev_20 float, Lev_21 float, Lev_22 float, Lev_23 float, Lev_24 float, 
    Lev_25 float, Lev_26 float, Lev_27 float, Lev_28 float, Lev_29 float, 
    Lev_30 float, Lev_31 float, Lev_32 float, Lev_33 float, Lev_34 float, 
    Lev_35 float, Lev_36 float, Lev_37 float, Lev_38 float, Lev_39 float, 
    Lev_40 float, Lev_41 float, Lev_42 float, Lev_43 float, Lev_44 float, 
    Lev_45 float, Lev_46 float, Lev_47 float, Lev_48 float, Lev_49 float, 
    Lev_50 float, Lev_51 float, Lev_52 float, Lev_53 float, Lev_54 float, 
    Lev_55 float, Lev_56 float, Lev_57 float, Lev_58 float, Lev_59 float, 
    Lev_60 float, Lev_61 float, Lev_62 float, Lev_63 float, Lev_64 float, 
    Lev_65 float, Lev_66 float, Lev_67 float, Lev_68 float, Lev_69 float, 
    Lev_70 float, Lev_71 float, Lev_72 float, Lev_73 float, Lev_74 float, 
    Lev_75 float, Lev_76 float, Lev_77 float, Lev_78 float, Lev_79 float, 
    Lev_80 float, Lev_81 float, Lev_82 float, Lev_83 float, Lev_84 float, 
    Lev_85 float, Lev_86 float, Lev_87 float, Lev_88 float, Lev_89 float, 
    Lev_90 float, Lev_91 float, Lev_92 float, Lev_93 float, Lev_94 float, 
    Lev_95 float, Lev_96 float, Lev_97 float, Lev_98 float, Lev_99 float
);

DROP TABLE IF EXISTS Wep_Up;
CREATE TABLE Wep_Up
(
	Up_Wep_Name VARCHAR(100),
    Up_Wep_Infus VARCHAR(10),
    Is_Scale_Up bool,
    PRIMARY KEY (Up_Wep_Name, Up_Wep_Infus),
    FOREIGN KEY (Up_Wep_Name, Up_Wep_Infus) REFERENCES Wep_Data(Wep_Name, Wep_Infus) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Wep_Scale_Coef;
CREATE TABLE Wep_Scale_Coef
(
	Coef_Wep_Name VARCHAR(100),
    Coef_Wep_Infus VARCHAR(10),
    Coef_Type VARCHAR(3),
    Coef int,
    PRIMARY KEY (Coef_Wep_Name, Coef_Wep_Infus, Coef_Type),
    FOREIGN KEY (Coef_Wep_Name, Coef_Wep_Infus) REFERENCES Wep_Data(Wep_Name, Wep_Infus) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Base_Dmg;
CREATE TABLE Base_Dmg
(
	Dmg_Wep_Name VARCHAR(100),
    Dmg_Wep_Infus VARCHAR(10),
    Dmg_Type VARCHAR(3), 
    Dmg float,
    PRIMARY KEY (Dmg_Wep_Name, Dmg_Wep_Infus, Dmg_Type),
    FOREIGN KEY (Dmg_Wep_Name, Dmg_Wep_Infus) REFERENCES Wep_Data(Wep_Name, Wep_Infus) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Scale_Grade;
CREATE TABLE Scale_Grade
(
	Grade_Wep_Name VARCHAR(100),
    Grade_Wep_Infus VARCHAR(10),
    Grade_Type VARCHAR(3),
    Grade VARCHAR(1),
    PRIMARY KEY (Grade_Wep_Name, Grade_Wep_Infus, Grade_Type),
    FOREIGN KEY (Grade_Wep_Name, Grade_Wep_Infus) REFERENCES Wep_Data(Wep_Name, Wep_Infus) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Reqs;
CREATE TABLE Reqs
(
	Req_Wep_Name VARCHAR(100),
    Req_Wep_Infus VARCHAR(10),
    Req_Type VARCHAR(3),
    Req int,
    PRIMARY KEY (Req_Wep_Name, Req_Wep_Infus, Req_Type),
    FOREIGN KEY (Req_Wep_Name, Req_Wep_Infus) REFERENCES Wep_Data(Wep_Name, Wep_Infus) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Wep_Curve;
CREATE TABLE Wep_Curve
(
	Crv_Wep_Name VARCHAR(100),
    Crv_Wep_Infus VARCHAR(10),
    Crv_Type VARCHAR(3),
    Crv int,
    PRIMARY KEY (Crv_Wep_Name, Crv_Wep_Infus, Crv_Type),
    FOREIGN KEY (Crv_Wep_Name, Crv_Wep_Infus) REFERENCES Wep_Data(Wep_Name, Wep_Infus) ON DELETE CASCADE,
	FOREIGN KEY (Crv) REFERENCES Sat_Curve(Curve_Ind) ON DELETE CASCADE
);
SELECT * FROM Wep_Up;