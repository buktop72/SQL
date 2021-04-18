import sqlalchemy
db = 'postgresql://dz4:123@localhost:5432/dz4'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()


sel1 = connection.execute("select title, year from albums where year = 1970;").fetchmany(5)
print(sel1)
print()
sel2 = connection.execute("select name, time from tracks order by time desc limit 1;").fetchone()
print(sel2)
print()
sel3 = connection.execute("select name, time from tracks where time >= 210 order by time asc;;").fetchmany(5)
print(sel3)
print()
sel4 = connection.execute("select * from albums where year > 1965 and year < 1970;").fetchmany(10)
print(sel4)
print()
sel5 = connection.execute("select singer from singers where (length(singer)-length(replace(singer,' ',''))+1)=1;").fetchmany(5)
print(sel5)
print()
sel6 = connection.execute("select name, time from tracks WHERE name LIKE '%%Me%%';").fetchmany(5)
print(sel6)
