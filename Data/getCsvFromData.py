import os
import sys
import hdf5_getters
import numpy as np
import glob
import csv

def get_all_files(basedir,ext='.h5') :
    """
    From a root directory, go through all subdirectories
    and find all files with the given extension.
    Return all absolute paths in a list.
    """
    allfiles = []
    for root, dirs, files in os.walk(basedir):
        files = glob.glob(os.path.join(root,'*'+ext))
        for f in files :
            allfiles.append( os.path.abspath(f) )
    return allfiles

def main():
    if len(sys.argv) != 2:
        print ('Takes one argument, the directory with the data files.')
        return
    
    hdf5_files = get_all_files(sys.argv[1])
    
    # Define properties to get
    properties = ['artist_terms', 'danceability', 'duration', 'end_of_fade_in', 'energy', 'key', 'loudness', 'mode', 'song_hotttnesss', 'start_of_fade_out', 'tempo', 'time_signature', 'track_id', 'year']
    
    with open('data.csv', 'w') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(properties)
        
        for abspath in hdf5_files:
            prop_values = []
            h5 = hdf5_getters.open_h5_file_read(abspath);
            for prop in properties:        
                prop_value = hdf5_getters.__getattribute__('get_' + prop)(h5)
                #print (prop_value)
                # special case artist terms to format it 
                if prop == 'artist_terms':
                    prop_values.append(';'.join(str(x) for x in prop_value))
                else:
                    prop_values.append(str(prop_value))          
            csvwriter.writerow(prop_values)
            h5.close();
    sys.exit(0)
    
if __name__ == '__main__':
    main()
