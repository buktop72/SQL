import sqlalchemy
from pprint import pprint 
db = 'postgresql://dz4:123@localhost:5432/dz4'
engine = sqlalchemy.create_engine(db)
connection = engine.connect()

print('1. количество исполнителей в каждом жанре:')
pprint(connection.execute("""
select genre, count(singer_id) from singergenre
join genres g on genre_id = g.id
group by g.genre
order by count(singer_id) desc;
""").fetchall())

print()
print('2. Rоличество треков, вошедших в альбомы 1969 - 1970  годов:')
pprint(connection.execute("""
select title, year, count(t.id) from albums a
join tracks t on a.id = t.album_id
group by title, year
having year >= 1969 and year <= 1970;
""").fetchall())

print()
print('3. Cредняя продолжительность треков по каждому альбому:')
pprint(connection.execute("""
select title, avg(time) from albums
join tracks on albums.id = tracks.album_id
group by title
""").fetchall())

print()
print('4. Все исполнители, которые не выпустили альбомы в 1970 году:')
pprint(connection.execute("""
select singer, year from singers s
join singeralbum sa on s.id = sa.singer_id
join albums a on sa.album_id = a.id
where year != 1970;
""").fetchall())

print()
print('5. Hазвания сборников, в которых присутствует конкретный исполнитель (выберите сами):')
pprint(connection.execute("""
select c.title, name from collections c
join trackcollection tc on c.id = tc.collection_id
join tracks t on tc.track_id = t.id
join albums a on t.album_id = a.id
join singeralbum sa on a.id = sa.album_id
join singers s on sa.singer_id = s.id
where singer = 'Nirvana'
""").fetchall())

print()
print('6. название альбомов, в которых присутствуют исполнители более 1 жанра:')
pprint(connection.execute("""
select title, singer, count(genre) from albums a
join singeralbum sa on a.id = sa.album_id
join singers s on sa.singer_id = s.id
join singergenre sg on s.id = sg.singer_id
join genres g on sg.genre_id = g.id
group by title, singer
having count(genre) > 1;
""").fetchall())

print()
print('7. наименование треков, которые не входят в сборники:')
pprint(connection.execute("""
select name from tracks t
left join trackcollection tc on t.id = tc.track_id
where tc.track_id is null;
""").fetchall())

print()
print('8. Исполнитель(-и), написавший самый короткий по продолжительности трек:')
pprint(connection.execute("""
select singer, name, min(time) from singers s
join singeralbum sa on s.id = sa.singer_id
join albums a on sa.album_id = a.id
join tracks t on a.id = t.album_id
where time = (
    select min(time) from tracks)
group by singer, name;
""").fetchall())

print()
print('9. название альбомов, содержащих наименьшее количество треков:')
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







