# ===================================================================
# Great resource for working with csv files
#    http://bconnelly.net/working-with-csvs-on-the-command-line/
# ===================================================================

# Remove first #n line from a file
cat input.csv | sed "1 d" 

# Strip all lines that are commented out
grep -v ^# input.csv 

# Return line numbers
grep -nr 'search string' file.csv

# Convert a tab seperated file to a comma seperated one
cat input.tsv | tr "\\t" ","

# Display the first 10 lines of a file
head input.csv

# List the number of rows
wc -l input.csv

# List rows without the filename
wc -l < input.csv

# Extract the first 13 lines 
head -n 13 input.csv 

# Extract the last 8 lines
tail -n 8 input.csv

# Extract specific lines of interest
sed -n "10,14 p" input.csv

# Extract columns 2, 4, 5 and 6
cut -d , -f 2,4-6 input.csv

# Read the 6th colum, remove the first line, delete blank lines, average
head data9thSept.csv | cut -d , -f 6 | grep . | sed "1 d" | awk '{ total += $1; count++ } END { print total/count }'

# Any of the above commands with slight modification can be used 
# with bzip2 or gzip'ed files

# To compress a file (bzip then gzip example)
bzip2 input.csv
gzip input.csv

# Then decompress (bzip then gzip example) and send to a file on the fly
bzcat input.csv.bz2 | cut -d , -f 3 > col3.csv
gunzip input.csv.gz | cut -d , -f 3 > col3.csv

# Sum the 4th column of a csv file
cat input.csv | awk -F "," '{ sum += $4 } END { printf "%.2f\n", sum }'

