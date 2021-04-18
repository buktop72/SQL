import sqlalchemy
from pprint import pprint 
db = 'postgresql://dz4:123@localhost:5432/dz4'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()


# sel1 = connection.execute("select title, year from albums where year = 1970;").fetchmany(5)
# print(sel1)
# print()
# sel2 = connection.execute("select name, time from tracks order by time desc limit 1;").fetchone()
# print(sel2)
# print()
# sel3 = connection.execute("select name, time from tracks where time >= 210 order by time asc;;").fetchmany(5)
# print(sel3)
# print()
# sel4 = connection.execute("select * from albums where year > 1965 and year < 1970;").fetchmany(10)
# print(sel4)
# print()
# sel5 = connection.execute("select singer from singers where (length(singer)-length(replace(singer,' ',''))+1)=1;").fetchmany(5)
# print(sel5)
# print()
# sel6 = connection.execute("select name, time from tracks WHERE name LIKE '%%Me%%';").fetchmany(5)
# print(sel6)
# print(engine.table_names())

# j1 = 
# print(connection.execute("""
# select singer, genre from singers
# join singergenre on singers.id = singergenre.singer_id
# join genres on singergenre.genre_id = genres.id;
# """).fetchall())
# print(j1)
# pprint(connection.execute("""
# select max(time) from tracks;
# """).fetchall())
# pprint(connection.execute("""
# select avg(time) from tracks;
# """).fetchall())

# pprint(connection.execute("""
# select count(distinct genre) from genres;
# """).fetchall())
# pprint(connection.execute("""
# select avg(time), sum(time) from tracks
# where album_id=3;
# """).fetchall())
# pprint(connection.execute("""
# select avg(time) from tracks
# """).fetchall())
# pprint(connection.execute("""
# select name, time from tracks
# where time < (
#     select avg(time) from tracks
# )
# order by time asc;
# """).fetchall())
# 
# pprint(connection.execute("""
# select genre_id, count(singer_id) from singergenre
# group by genre_id
# having count(singer_id) > 1
# order by count(singer_id);
# """).fetchall())

# pprint(connection.execute("""
# select singer_id, count(genre_id) from singergenre
# group by singer_id
# order by count(genre_id);
# """).fetchall())

# pprint(connection.execute("""
# select singer, genre_id from singers
# join singergenre s on s.singer_id = singers.id;
# """).fetchall())

# pprint(connection.execute("""
# select singer, count(genre_id) from singers
# join singergenre s on s.singer_id = singers.id
# group by singer
# order by count(genre_id);
# """).fetchall())

# pprint(connection.execute("""
# select singer, genre from singers
# join singergenre on singers.id = singergenre.singer_id
# join genres on singergenre.genre_id = genres.id;
# """).fetchall())

# pprint(connection.execute("""
# select genre_id, count(singer_id) from singergenre
# group by genre_id
# order by genre_id;
# """).fetchall())

# 1. количество исполнителей в каждом жанре;
# pprint(connection.execute("""
# select genre, count(singer_id) from singergenre
# join genres on genre_id = genres.id
# group by genres.genre
# order by count(singer_id) desc;
# """).fetchall())

# 2. количество треков, вошедших в альбомы 1969 - 1970  годов;
# pprint(connection.execute("""
# select title, year, count(tracks.id) from albums
# join tracks on albums.id = tracks.album_id
# group by title, year
# having year >= 1969 and year <= 1970;
# """).fetchall())

# 3. средняя продолжительность треков по каждому альбому;
# pprint(connection.execute("""
# select title, avg(time) from albums
# join tracks on albums.id = tracks.album_id
# group by title
# """).fetchall())

# 4. все исполнители, которые не выпустили альбомы в 1970 году;
# pprint(connection.execute("""
# select singer, year from singers
# join singeralbum on singers.id = singeralbum.singer_id
# join albums on singeralbum.album_id = albums.id
# where year != 1970;
# """).fetchall())

# 5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
# pprint(connection.execute("""
# select collections.title, name from collections
# join trackcollection on collections.id = trackcollection.collection_id
# join tracks on trackcollection.track_id = tracks.id
# join albums on tracks.album_id = albums.id
# join singeralbum on albums.id = singeralbum.album_id
# join singers on singeralbum.singer_id = singers.id
# where singer = 'Nirvana'
# """).fetchall())

# 6. название альбомов, в которых присутствуют исполнители более 1 жанра;
# pprint(connection.execute("""
# select title, singer, count(genre) from albums
# join singeralbum on albums.id = singeralbum.album_id
# join singers on singeralbum.singer_id = singers.id
# join singergenre on singers.id = singergenre.singer_id
# join genres on singergenre.genre_id = genres.id
# group by title, singer
# having count(genre) > 1;
# """).fetchall())

# 7. наименование треков, которые не входят в сборники;
# pprint(connection.execute("""
# select name from tracks
# left join trackcollection on tracks.id = trackcollection.track_id
# where trackcollection.track_id is null;
# """).fetchall())

# 8. исполнителя(-ей), написавшего самый короткий по продолжительности трек 
# (теоретически таких треков может быть несколько)
# pprint(connection.execute("""
# select singer, name, min(time) from singers
# join singeralbum on singers.id = singeralbum.singer_id
# join albums on singeralbum.album_id = albums.id
# join tracks on albums.id = tracks.album_id
# where time = (
#     select min(time) from tracks)
# group by singer, name;
# """).fetchall())

# Вы можете использовать предложение with, чтобы дать псевдоним вашему запросу "count" и рассматривать его 
# как временную таблицу. Затем выберите a_id с num_links меньше или равно - к наименьшему счету в num_links.
# WITH link_counts AS (
#          SELECT a_id, COUNT(b_id) as num_links
#            FROM table_c
#        GROUP BY a_id
#      )
# SELECT a_id
#   FROM link_counts
#  WHERE num_links <= (SELECT MIN(num_links) FROM link_counts)



# 9. название альбомов, содержащих наименьшее количество треков.
pprint(connection.execute("""
select title, count(album_id) from albums
join tracks on albums.id = tracks.album_id
group by title
having count(album_id) = (
    SELECT min(track_album) FROM (
    SELECT count(album_id) track_album FROM albums
    join tracks on albums.id = tracks.album_id
    group by title
    ) x
)
""").fetchall())

# 9. название альбомов, содержащих наименьшее количество треков.
# pprint(connection.execute("""
# SELECT min(track_album) FROM (
#     SELECT count(album_id) track_album FROM albums
#     join tracks on albums.id = tracks.album_id
#     group by title
#     ) x;
# """).fetchall())

















