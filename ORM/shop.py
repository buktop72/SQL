import sqlalchemy as sq
from sqlalchemy.orm import declarative_base, sessionmaker, relationship
from pprint import pprint
Base = declarative_base()
DSN = 'postgresql://dz4:123@localhost:5432/dz4'
engine = sq.create_engine(DSN)
Session = sessionmaker(bind=engine)
session = Session()
# почему нужна отдельная таблица, а не класс для такой таблицы?

singergenre = sq.Table(
    'singergenre', Base.metadata,
    sq.Column('singer_id', sq.Integer, sq.ForeignKey('singers.id'), primary_key=True),
    sq.Column('genre_id', sq.Integer, sq.ForeignKey('genres.id'), primary_key=True)
)

class Singers(Base):
    __tablename__ = 'singers'    
    id = sq.Column(sq.Integer, primary_key=True)
    singer = sq.Column(sq.String(50), nullable=False)
    genres = relationship('Genres', secondary=singergenre, backref='singers')    
    def __str__(self):
        return f'id - {self.id}, artist_name - {self.singer}'
    def __repr__(self):
        return str(self)

class Genres(Base):
    __tablename__ = 'genres'    
    id = sq.Column(sq.Integer, primary_key=True)
    genre = sq.Column(sq.String(150), nullable=False)    
    def __str__(self):
        return f'genre_id - {self.id}, genre - {self.genre}'
    def __repr__(self):
        return str(self)

singeralbum = sq.Table(
    'singeralbum', Base.metadata,
    sq.Column('singer_id', sq.Integer, sq.ForeignKey('singers.id'), primary_key=True),
    sq.Column('album_id', sq.Integer, sq.ForeignKey('albums.id'), primary_key=True)
)

class Albums(Base):
    __tablename__ = 'albums'
    id = sq.Column(sq.Integer, primary_key=True)   
    title = sq.Column(sq.String)   
    year = sq.Column(sq.Integer)   
    # tracks = relationship('Tracks', back_populates='album') # ==> Tracks.album
    singers = relationship('Singers', secondary=singeralbum, backref='albums')  
    def __str__(self):
        return f'{self.id}: {self.title}, {self.year}'
    def __repr__(self):
        return str(self)

class Tracks(Base):
    __tablename__ = 'tracks'
    id = sq.Column(sq.Integer, primary_key=True)   
    name = sq.Column(sq.String) 
    time = sq.Column(sq.Integer)   
    album_id = sq.Column(sq.Integer, sq.ForeignKey('albums.id'))   
    # album = relationship(Albums, back_populates='tracks') # ==> Albums.tracks
    def __str__(self):
        return f'{self.id}: {self.name}, {self.time}, {self.album_id}'
    def __repr__(self):
        return str(self)

trackcollection = sq.Table(
    'trackcollection', Base.metadata,
    sq.Column('track_id', sq.Integer, sq.ForeignKey('tracks.id'), primary_key=True),
    sq.Column('collection_id', sq.Integer, sq.ForeignKey('collections.id'), primary_key=True)
)

class Collections(Base):
    __tablename__ = 'collections'
    id = sq.Column(sq.Integer, primary_key=True)   
    title = sq.Column(sq.Integer) 
    year = sq.Column(sq.Integer)
    tracks = relationship('Tracks', secondary=trackcollection, backref='collections')  
    def __str__(self):
        return f'{self.id}: {self.title}, {self.year}'
    def __repr__(self):
        return str(self)

print('Все исполнители в жанре Панк')
query = session.query(Singers).join(Singers.genres).filter(Genres.genre == 'Punk')
pprint(query.all())
print()
print('Все альбомы Black Sabbat')
query = session.query(Albums).join(Albums.singers).filter(Singers.singer == 'Black Sabbath')
pprint(query.all())
print()
print('Все сборники, где есть "Smells Like Teen Spirit"')
query = session.query(Collections).join(Collections.tracks).filter(Tracks.name == 'Smells Like Teen Spirit')
pprint(query.all())
print()
print('Трек лист альбома "Black Sabbath"')
query = session.query(Tracks).join(Albums).filter(Albums.title == 'Black Sabbath')
pprint(query.all())
print()
print('Hard-Rock исполнители в сборниках')
query = session.query(Singers, Collections).join(Singers.genres).join(Singers.albums).join(Tracks).join(Tracks.collections).filter(Genres.genre == 'Hard rock')
pprint(query.all())
# print(query)