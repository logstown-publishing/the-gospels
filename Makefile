gospels.prince.pdf: all.htm gospels.css fonts.css page-numbers.css tabs.css
	./prince all.htm \
		--style=gospels.css \
		--output=gospels.prince.pdf \
		--no-default-style

preface.pdf: preface.htm preface.css gospels.css fonts.css
	./prince preface.htm \
		--style=preface.css \
		--output=preface.pdf \
		--no-default-style

title.pdf: title.htm gospels.css fonts.css
	./prince title.htm \
		--style=gospels.css \
		--output=title.pdf \
		--no-default-style

all.htm: preface.htm gospels.htm
	cat preface.htm gospels.htm > all.htm

gospels.htm: gospels.raw.htm cleanup.py doubles.txt paragraphs.txt next-line.txt phrases.txt end.htm
	python cleanup.py

gospels.raw.htm:
	cat webhtm/Mark.htm \
		webhtm/Matthew.htm \
		webhtm/Luke.htm \
		webhtm/John.htm \
		> gospels.raw.htm

clean:
	rm -f \
		gospels.prince.pdf \
		preface.pdf \
		all.htm \
		gospels.htm \
		gospels.raw.htm 
