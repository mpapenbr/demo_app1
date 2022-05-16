#
# Arguments: all arguments are passed to svu
# Tasks
# - verify tests are running
# - verify goreleaser with "--snapshot --skip-publish --rm-dist"
# - replace cmd/version via sed
# 
FULL_TAG=$(svu $@)
NO_PREFIX_TAG=$(svu $@ --strip-prefix)
echo $FULL_TAG
echo $NO_PREFIX_TAG

# updating the version in cmd/version.go
go test ./... && \
echo "version: $FULL_TAG" > version.txt && \
git add version.txt && git commit -m "chore: updated version.txt for $FULL_TAG" && \
git tag -a $FULL_TAG -m "Release $FULL_TAG" && \
git push origin main --tags
