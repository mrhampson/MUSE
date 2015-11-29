# MUSE

##Data
These will be the features we use:

+	artist_term
	+	Echo Nest tags
+	danceability	(REMOVED, datasheets come back as all 0s)
	+	between 0 and 1
+	duration
	+	in seconds
+	end_of_fade_in
	+	end time in seconds
+	energy	(REMOVED, datasheets come back as all 0s)
	+	between 0 and 1
+	key (estimation)
	+	key signiatures start at 0 (C) and ascend the chomatic scale 1 (D-flat)
+	loudness
	+	measured in dB
+	mode (estimation)
	+	major or minor
+	song_hotness	(some are NaN)
	+	algorithmic estimation
+	start_of_fade_out
	+	start time in seconds
+	tempo
	+	in BPM
+	time_signature (estimation)
	+	beats per bar
+	track_id
+	year
	+	year of release, 0 if not known

http://labrosa.ee.columbia.edu/millionsong/pages/field-list

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
