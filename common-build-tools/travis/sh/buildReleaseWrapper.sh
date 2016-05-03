#!/usr/bin/env bash
#
# Copyright (C) 2015-2016 Orange
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -ev

echo "TRAVIS_BRANCH: <$TRAVIS_BRANCH> - TRAVIS_TAG: <$TRAVIS_TAG>"

#Download dependencies
mvnw -q help:evaluate -Dexpression=project.version --settings settings.xml
# Capture execution of maven command - It looks like grep cannot be used like this on travis
export VERSION_SNAPSHOT=$(mvnw help:evaluate -Dexpression=project.version --settings settings.xml |grep '^[0-9].*')

echo "Current version extracted from pom.xml: $VERSION_SNAPSHOT"
export VERSION_PREFIX=$(expr "$VERSION_SNAPSHOT" : "\(.*\)-SNAP.*")

if [ "${TRAVIS_PULL_REQUEST}" = "false" -a "$TRAVIS_BRANCH" = "master" ]
then
	#We are on master without PR
	export RELEASE_CANDIDATE_VERSION=$VERSION_PREFIX.${TRAVIS_BUILD_NUMBER}
	git checkout -b "release-candidate/$RELEASE_CANDIDATE_VERSION"

	echo "Release candidate snapshot version: $RELEASE_CANDIDATE_VERSION"

	echo "Setting new version old: $VERSION_SNAPSHOT"

	#Download dependencies
	mvnw -q release:help --settings settings.xml
    mvnw --batch-mode -e release:prepare release:perform --settings settings.xml

	echo $RELEASE_CANDIDATE_VERSION > RELEASE_CANDIDATE_VERSION
else
	mvnw -q install:help --settings settings.xml
	mvnw install --settings settings.xml
fi



