require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  results = db.execute("SELECT
                        tracks.name,
                        albums.title,
                        artists.name
                        FROM tracks
                        JOIN albums ON tracks.album_id = albums.id
                        JOIN artists ON albums.artist_id = artists.id")
  return results
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  results = db.execute("SELECT COUNT(*), ROUND(AVG(milliseconds) / 60000, 2)
                        FROM tracks
                        JOIN genres ON genres.id = tracks.genre_id
                        WHERE genres.name = '#{genre_name}'")
  hash = {
    category: genre_name,
    number_of_songs: results.flatten[0],
    avg_length: results.flatten[1]
  }
  return hash
end

def top_five_artists(db, genre_name)
  # artist id, the artist name and the number of songs
  # TODO: return list of top 5 artists with the most songs for a given genre.
  results = db.execute("SELECT artists.id, artists.name, COUNT(*) as count
                        FROM tracks
                        JOIN albums ON tracks.album_id = albums.id
                        JOIN artists ON albums.artist_id = artists.id
                        JOIN genres ON genres.id = tracks.genre_id
                        WHERE genres.name = '#{genre_name}'
                        GROUP BY artists.name
                        ORDER BY count DESC
                        LIMIT 5;")
  return results
end
