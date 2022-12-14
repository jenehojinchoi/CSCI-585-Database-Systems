CREATE EXTENSION postgis;
CREATE EXTENSION postgis_raster;
CREATE EXTENSION postgis_topology;

CREATE TABLE SpatialData(
	locname varchar(50),
	geolocation geometry
);

INSERT INTO SpatialData VALUES 
('Leavey Fountain', 'POINT(-118.28264071617114 34.02131491343865)'),
('Leavey Fountain', 'POINT(-118.28312552545059 34.02159595865199)'),
('The Carolyn Craig Franklin Library Garden Fountain', 'POINT(-118.28349323141242 34.02047793849755)'),
('Doheny Memory Library', 'POINT(-118.28264071617114 34.02131491343865)'),
('Patsy Fountain', 'POINT(-118.28512198214101 34.02026847473729)'),
('Panda Express','POINT(-118.28601191493899 34.02031887012779)'),
('City Tacos', 'POINT(-118.28452811881083 34.02413723129871)'),
('McClintock Ave Entrance', 'POINT(-118.28751588619613 34.02505923817232)'),
('Downey Way Entrance', 'POINT(-118.29125840220978 34.02189339483794)'),
('Tutor Hall Cafe', 'POINT(-118.29016355808665 34.01995138734030)'),
('Science Engineering Libary', 'POINT(-118.28888623986234 34.01997640732121)'),
('Epstein Fountain', 'POINT(-118.28911137778152 34.02056653521406)'),

SELECT * From SpatialData;

SELECT ST_AsText(ST_ConvexHull(
    ST_Collect(
        ST_GeomFromText('MULTILINESTRING((100 190,10 8),(150 10, 20 30))'),
            ST_GeomFromText('MULTIPOINT(
				-118.28264071617114 34.02131491343865,
				-118.28312552545059 34.02159595865199,
				-118.28349323141242 34.02047793849755,
				-118.28264071617114 34.02131491343865,
				-118.28512198214101 34.02026847473729, 
				-118.28601191493899 34.02031887012779, 
				-118.28452811881083 34.02413723129871,
				-118.28751588619613 34.02505923817232,
				-118.29125840220978 34.02189339483794,
				-118.29016355808665 34.01995138734030,
				-118.28888623986234 34.01997640732121,
				-118.28911137778152 34.02056653521406, 
			)')
    )));