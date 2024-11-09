install:
	tuist install

generate:
	make install
	tuist generate

setup:
	sh Scripts/Setup.sh

clean:
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace

reset:
	tuist clean
	rm -rf **/*.xcodeproj
	rm -rf *.xcworkspace