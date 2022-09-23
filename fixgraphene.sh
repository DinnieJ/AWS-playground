#!/bin/bash
# Run this script when you are having problem with graphene lib on django 4
# https://stackoverflow.com/questions/70382084/import-error-force-text-from-django-utils-encoding
# Otherwise, don't. This script is stupid and dangerous

python_version=$(python -c "
from platform import python_version
print(\".\".join(python_version().split(\".\")[:2]))
")

LIB_PATH=$(dirname $(which python))/../lib/python$python_version/site-packages/graphene_django/utils/utils.py

bash -c "sed -i 's/force_text/force_str/g' $LIB_PATH"
