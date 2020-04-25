# git

## patches

    # create patches
    git format-patch -<n> HEAD

## tags

    # add tag
    git tag v0.0.1
    # push tag
    git push --tags
    # delete local tag
    git tag -d v0.0.1
    # delete remote tag
    git push origin :refs/tags/v0.0.1
