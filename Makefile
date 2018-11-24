.PHONY = gen force-gen soft-clean clean

SOURCE_DIR ?= ./src
DEPLOY_DIR ?= ./deploy
SITE_TITLE ?= "fili.pe"
SITE_BASE_URL ?= "https://fili.pe"

gen:
	@mkdir -p ${DEPLOY_DIR}
	bin/ssg3 ${SOURCE_DIR} ${DEPLOY_DIR} ${SITE_TITLE} ${SITE_BASE_URL}

force-gen: soft-clean gen

soft-clean:
	rm -f ${DEPLOY_DIR}/.files

clean:
	rm -rf ${DEPLOY_DIR}

