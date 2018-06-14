default: build test

pkgname=circleci-cli
pkgver=0.0.4705
pkgrel=1

deps:
	pacman -S namcap
	git submodule init
	git submodule update

build:
	makepkg

test:
	namcap PKGBUILD

clean:
	rm -r circleci* pkg src LICENSE

AUR_GIT_SUBMODULE=circleci-cli

deploy:
	makepkg --printsrcinfo > .SRCINFO
	cp PKGBUILD .SRCINFO $AUR_GIT_SUBMODULE
	cd $AUR_GIT_SUBMODULE && printf 'Navigating into '
	printf 'Navigate into the %s submodule and push changes to the AUR git repo\n' "$AUR_GIT_SUBMODULE"
