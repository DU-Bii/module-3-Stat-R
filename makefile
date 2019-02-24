## Diplome Universitaire en Bioinformatique Integrative (DU-Bii)
## Task management for module 3: Analyse statistique avec R.

REPO=module-3-Stat-R
GITHUB=https://github.com/DU-Bii
WEB=https://du-bii.github.io/${REPO}
RPROJ=${REPO}.Rproj

targets:
	@echo "Targets for ${REPO}"
	@echo "	param		list parameters"
	@echo "	web		open the Web site of this course"
	@echo "	repo		open the github repository"
	@echo "	project		open the project with RStudio"

param:
	@echo "Parameters"
	@echo "	REPO			${REPO}"
	@echo "	GITHUB			${GITHUB}"
	@echo "	WEB				${WEB}"
	@echo "	RPROJ			${RPROJ}"

project:
	@open ${RPROJ}

web:
	@open ${WEB}
	
repo:
	@open ${REPO}
