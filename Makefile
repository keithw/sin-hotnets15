.PHONY: FORCE
sin.pdf: FORCE
	./latexrun sin

.PHONY: clean
clean:
	./latexrun --clean-all
