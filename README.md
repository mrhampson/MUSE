# MUSE

##Data
###Python
To build the csv file first download the MillionSongSubset files. Then ```cd``` into the directory with ```getCsvFromData.py```
and run the command ```python getCsvFromData.py <path to MillionSongSubset/data/>```

###SQL
This folder contains a file ```merged_song_database.db``` which is a combination of ```subset_artist_similarity.db```,
```subset_artist_term.db```, and ```subset_track_metadata.db``` from the original subset data.
To get the ```song_data.csv``` I ran this query against the database
```sql
select 
songs.*,
group_concat(artist_term.term, ';')
from songs
inner join artist_term
on artist_term.artist_id = songs.artist_id
group by track_id;
```
which just appends a list of the artist tems separated by a ';' to each track.
That should give us a decent start.

You can download any sqlite db browser like [sqlite browser]: http://sqlitebrowser.org/ to run your own SQL queries against it.
