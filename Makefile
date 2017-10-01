.PHONY: clean-pyc develop

help:
	@echo "clean-pyc - remove Python file artifacts"
	@echo "develop - build and create app"

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	rm -rf tsp_rest_api.egg-info dist build

develop: clean-pyc
	pip install -e .[testing,docs]
	tsp_rest_api settings
	tsp_rest_api runserver

