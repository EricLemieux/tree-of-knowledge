.PHONY: table-of-contents
table-of-contents:
	@find . -not -path '*/\.*' -type d -print0 \
		| xargs --null -n 1 ./.scripts/table-of-contents.sh
