import csv
import codecs
from bs4 import BeautifulSoup

with codecs.open('data/cardioActivities.csv', "r", encoding='utf-8', errors='ignore') as cFile:
    # Create reader 
    reader = csv.DictReader(cFile)
    # Create two new columns headers to be used in output
    reader.fieldnames.append('Latitude')
    reader.fieldnames.append('Longitude')
    # Create writer, passing column headers
    writer = csv.DictWriter(codecs.open('../data/output.csv','wb', encoding='utf-8', errors='ignore'), fieldnames=reader.fieldnames)
    writer.writeheader()
    # For each line in the input file,
    for line in reader:
        # If line contains GPX file, extract the file name
        if line['GPX File'] != "":
            gpxFile = line['GPX File']
            # Open the GPX file to extract last recorded GPS coordinate for the run
            with codecs.open('data/'+ gpxFile, 'r') as gFile:
                x = BeautifulSoup(gFile, 'xml')
                lastTrkpts = x.find_all('trkpt')[-1]
                # Append lat, long values to the two newly created columns in the output file
                line['Latitude'] = lastTrkpts['lat']
                line['Longitude'] = lastTrkpts['lon']
        # Add line, appended or not, to output file
        writer.writerow(line)

# https://stackoverflow.com/questions/3428532/how-to-import-a-csv-file-using-python-with-headers-intact-where-first-column-is
# https://stackoverflow.com/questions/25496999/getting-content-from-last-element-using-beautifulsoup-find-all
# and many more ha