.PHONY: install clean

ORGS := SergioBenitez

install: \
	vendor/SergioBenitez/Rocket

vendor/$(ORGS)/Rocket: vendor/$(ORGS)
	git clone git@github.com:SergioBenitez/Rocket.git $@

vendor/$(ORGS): vendor
	mkdir $@

vendor:
	mkdir $@

clean:
	rm -rf vendor