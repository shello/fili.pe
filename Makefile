.PHONY = gen force-gen watch soft-clean clean

SOURCE_DIR ?= ./src
DEPLOY_DIR ?= ./deploy
WATCH_DEPLOY_DIR ?= ./deploy.local
SITE_TITLE ?= "fili.pe"
SITE_BASE_URL ?= "https://fili.pe"

gen:
	@mkdir -p ${DEPLOY_DIR}
	bin/ssg3 ${SOURCE_DIR} ${DEPLOY_DIR} ${SITE_TITLE} ${SITE_BASE_URL}

force-gen: soft-clean gen

# Based on https://www.romanzolotarev.com/ssg.html#Watch
watch:
	@mkdir -p ${WATCH_DEPLOY_DIR}
	-sh -c 'while :; do find . -type f ! -path "*/.*" | entr -d bin/ssg3 ${SOURCE_DIR} ${WATCH_DEPLOY_DIR} "[LIVE $(date)] "${SITE_TITLE} "//"; done'

soft-clean:
	rm -f ${DEPLOY_DIR}/.files

clean:
	rm -rf ${DEPLOY_DIR}

