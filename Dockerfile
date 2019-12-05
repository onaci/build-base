

FROM docker:18

RUN apk --no-cache add \
	git bash coreutils curl git grep sed sudo findutils jq zip make gettext openssh make
