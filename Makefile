.PHONY: clean-pyc develop

help:
	@echo "clean-pyc - remove Python file artifacts"
	@echo "develop - build and create app"

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	rm -rf tsp_rest_api_server.egg-info dist build

develop: clean-pyc
	pip install -e .[testing,docs]
	tsp_rest_api_server settings
	export EVE_SETTINGS=$PWD/settings.py
	tsp_rest_api_server runserver

