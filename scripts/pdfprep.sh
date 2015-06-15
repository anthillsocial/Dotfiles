# Create a copy of all files
mkdir convert 
cp ./* convert/
# Convert files etc into .pdf
unoconv -fpdf convert/*.docx
unoconv -fpdf convert/*.odp
unoconv -fpdf convert/*.doc
unoconv -fpdf convert/*.jpg
# Merge .pdf documents into one
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=convert/COMBINED.pdf convert/*.pdf
mv convert/COMBINED.pdf ./
rm -r convert
