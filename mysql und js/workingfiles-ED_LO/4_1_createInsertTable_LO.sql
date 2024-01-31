-- ---------------------------------------------------------------------------------------------------------------------
-- 4. Anlegen und füllen der Tabelle
-- ---------------------------------------------------------------------------------------------------------------------

-- ---------------------------------------------------------------------------------------------------------------------
-- 4.1 Die neue DB wird in die Console genommen, damit Berechtigungen müssen jetzt noch aktiviert werden
-- ---------------------------------------------------------------------------------------------------------------------
USE appDB;

-- ---------------------------------------------------------------------------------------------------------------------
-- 4.2 Sicherheitshalber löschen der Tabelle customer
-- ---------------------------------------------------------------------------------------------------------------------
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS Gericht;
DROP TABLE IF EXISTS SpezielleAnforderungen;
-- ---------------------------------------------------------------------------------------------------------------------
-- 4.3 Anlegen der Tabellen
-- ---------------------------------------------------------------------------------------------------------------------

-- Tabelle ArchiviertePlaene
CREATE TABLE WochenMenu (
                            WochenMenuID INT PRIMARY KEY,
                            Woche DATE NOT NULL,
                            Budget DECIMAL(10, 2) NOT NULL
);


-- Tabelle ArchiviertePlaene
CREATE TABLE ArchiviertePlaene (
                                   ArchivID INT PRIMARY KEY,
                                   WochenMenuID INT,
                                   Archivierungsdatum DATE NOT NULL,
                                   FOREIGN KEY (WochenMenuID) REFERENCES WochenMenu(WochenMenuID)
);

-- Tabelle Gericht
CREATE TABLE Gericht (
                         GerichtID INT PRIMARY KEY,
                         WochenMenuID INT,
                         Name VARCHAR(255) NOT NULL,
                         Preis DECIMAL(5, 2) NOT NULL,
                         SpezielleAnforderungenID INT,
                         FOREIGN KEY (WochenMenuID) REFERENCES WochenMenu(WochenMenuID)
);

-- Tabelle SpezielleAnforderungen
CREATE TABLE SpezielleAnforderungen (
                                        AnforderungenID INT NOT NULL,
                                        GerichtID INT,
                                        Name VARCHAR(255) NOT NULL
);
ALTER TABLE SpezielleAnforderungen
    ADD FOREIGN KEY (GerichtID) REFERENCES Gericht(GerichtID);

-- Tabelle User
CREATE TABLE User (
                      UserID INT PRIMARY KEY,
                      GerichtID INT,
                      Name VARCHAR(255) NOT NULL,
                      Rolle VARCHAR(50) NOT NULL,
                      FOREIGN KEY (GerichtID) REFERENCES Gericht(GerichtID)
);



-- ---------------------------------------------------------------------------------------------------------------------
-- 4.4 Füllen der Tabelle mit Initialdaten
-- ---------------------------------------------------------------------------------------------------------------------

-- Beispiel Daten für WochenMenu
INSERT INTO WochenMenu (WochenMenuID, Woche, Budget) VALUES
                                                         (1, '2023-12-11', 1000.00),
                                                         (2, '2023-12-18', 1200.00),
                                                         (3, '2023-12-25', 900.00),
                                                         (4, '2024-01-01', 1100.00),
                                                         (5, '2024-01-08', 950.00),
                                                         (6, '2024-01-15', 1050.00),
                                                         (7, '2024-01-22', 800.00),
                                                         (8, '2024-01-29', 1150.00),
                                                         (9, '2024-02-05', 950.00),
                                                         (10, '2024-02-12', 1000.00);

-- Beispiel Daten für ArchiviertePlaene
INSERT INTO ArchiviertePlaene (ArchivID, WochenMenuID, Archivierungsdatum) VALUES
                                                                               (1, 1, '2023-12-11'),
                                                                               (2, 2, '2023-12-18'),
                                                                               (3, 3, '2023-12-25'),
                                                                               (4, 4, '2024-01-01'),
                                                                               (5, 5, '2024-01-08'),
                                                                               (6, 6, '2024-01-15'),
                                                                               (7, 7, '2024-01-22'),
                                                                               (8, 8, '2024-01-29'),
                                                                               (9, 9, '2024-02-05'),
                                                                               (10, 10, '2024-02-12');


-- Beispiel Daten für Gericht
INSERT INTO Gericht (GerichtID, WochenMenuID, Name, Preis) VALUES
                                                               (1, 1, 'Pasta Carbonara', 12.99),
                                                               (2, 1, 'Hähnchenbrust mit Gemüse', 15.50),
                                                               (3, 2, 'Vegetarische Lasagne', 11.99),
                                                               (4, 2, 'Rindfleischcurry mit Reis', 17.99),
                                                               (5, 3, 'Tomatensuppe', 7.99),
                                                               (6, 3, 'Gebratener Lachs', 19.99),
                                                               (7, 4, 'Chicken Alfredo', 14.99),
                                                               (8, 4, 'Gemüsepfanne mit Quinoa', 16.50),
                                                               (9, 5, 'Spinat-Feta-Salat', 9.99),
                                                               (10, 5, 'Schweinefilet mit Kartoffelpüree', 18.50);

-- Beispiel Daten für SpezielleAnforderungen
INSERT INTO SpezielleAnforderungen (AnforderungenID, GerichtID, Name) VALUES
                                                                          (1, 1, 'Kein Speck'),
                                                                          (2, 1, 'Glutenfrei'),
                                                                          (3, 4, 'Scharf'),
                                                                          (4, 6, 'Ohne Nüsse'),
                                                                          (5, 8, 'Vegan'),
                                                                          (6, 10, 'Laktosefrei'),
                                                                          (7, 10, 'Ohne Zwiebeln'),
                                                                          (8, 3, 'Ohne Pilze'),
                                                                          (9, 7, 'Ohne Knoblauch'),
                                                                          (10, 2, 'Ohne Tomatensoße');

-- Beispiel Daten für User
INSERT INTO User (UserID, GerichtID, Name, Rolle) VALUES
                                                      (1, 1, 'Anna Müller', 'Küchenchef'),
                                                      (2, 3, 'Peter Schmidt', 'Koch'),
                                                      (3, 5, 'Maria Weber', 'Kellnerin'),
                                                      (4, 7, 'Michael Fischer', 'Koch'),
                                                      (5, 9, 'Laura Wagner', 'Kellnerin'),
                                                      (6, 2, 'Thomas Becker', 'Koch'),
                                                      (7, 4, 'Sophie Mayer', 'Kellnerin'),
                                                      (8, 6, 'Markus Keller', 'Koch'),
                                                      (9, 8, 'Emma Schneider', 'Kellnerin'),
                                                      (10, 10, 'David Braun', 'Koch');


-- ---------------------------------------------------------------------------------------------------------------------
-- 4.5 Einige Kontrollselects
-- ---------------------------------------------------------------------------------------------------------------------
Select * from WochenMenu;
Select * from ArchiviertePlaene;
Select * from Gericht;
Select * from SpezielleAnforderungen;
Select * from User;
select current_date;