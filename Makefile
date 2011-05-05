gospels.pdf: all.htm gospels.css fonts.css
	../bin/prince all.htm \
		--style=gospels.css \
		--output=gospels.pdf \
		--no-default-style

preface.pdf: preface.htm gospels.css fonts.css
	../bin/prince preface.htm \
		--style=gospels.css \
		--output=preface.pdf \
		--no-default-style

all.htm: preface.htm gospels.htm
	cat preface.htm gospels.htm > all.htm

gospels.htm: gospels.raw.htm cleanup.py doubles.txt paragraphs.txt next-line.txt phrases.txt colophon.htm
	python cleanup.py

gospels.raw.htm:
	cat webhtm/Mark.htm \
	    webhtm/Matthew.htm \
	    webhtm/Luke.htm \
	    webhtm/John.htm \
	    > gospels.raw.htm
