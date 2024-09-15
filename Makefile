install:
	pip install -r requirements.txt
format:
	black *.py
lint:
	#pylint --disable=R,C --ignore-patterns=test_main.py main.py
	ruff check *.py *.ipynb ./lib/*.py
	#ruff check main.py mylib/stats_aplt.py main_test.py #main.ipynb
test:
	python -m pytest -vv --nbval -cov=mylib -cov=main test_main.py main.ipynb
all: install format test lint