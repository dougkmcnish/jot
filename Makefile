VERSION = v1.0.0-beta2
.PHONY: scripts clean
	
all: win64 win32 linux64 linux32 darwin

install:
	go install

win64:
	GOOS=windows GOARCH=amd64 go build -o dist/jot.exe

win32:
	GOOS=windows GOARCH=386 go build -o dist/jot32.exe

linux64:
	GOOS=linux GOARCH=amd64 go build -o dist/jot_linux

linux32:
	GOOS=linux GOARCH=386 go build -o dist/jot_linux32

darwin:
	GOOS=darwin GOARCH=amd64 go build -o dist/jot_darwin

scripts:
	cp scripts/* dist/

zip:
	cd dist/ && zip -r jot-$(VERSION).zip jot* gjot.sh

tar:
	cd dist/ && tar -czf jot-$(VERSION).tar.gz jot* gjot.sh

package: scripts zip tar

clean:
	rm -f dist/*